#include "disk.h"
#include "interrupt.h"
#include "APIC.h"
#include "memory.h"
#include "printk.h"
#include "lib.h"

/*
disk_flags:
1: Queue is busy
0: Queue is free
*/
//static int disk_flags=0;
static unsigned long query_num=0;

hw_int_controller disk_int_controller={
	.enable=IOAPIC_enable,
	.disable=IOAPIC_disable,
	.install=IOAPIC_install,
	.uninstall=IOAPIC_uninstall,
	.ack=IOAPIC_edge_ack,
};

void end_request(struct block_buffer_node *node){
	if(node==NULL) {
		printk(RED,BLACK,"disk end request error");
	}
	node->wait_queue.tsk->state=TASK_RUNNING;
	insert_task_queue(node->wait_queue.tsk);
	node->wait_queue.tsk->flags|=NEED_SCHEDULE;

	kfree((unsigned long*)disk_request.in_using);
	disk_request.in_using=NULL;

	//disk_flags=0;

	if(disk_request.block_request_count){// keep sending request to disk
		cmd_out();
	}
}

void read_handler(unsigned long nr, unsigned long parameter){
	struct block_buffer_node *node=((struct request_queue*)parameter)->in_using;

	if(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_ERROR){
		printk(RED,BLACK,"read_handler: %x\n",io_in8(PORT_DISK0_ERR_FEATURE));
	}else{
		port_insw(PORT_DISK0_DATA,node->buffer,256);
	}

	end_request(node);
}

void write_handler(unsigned long nr, unsigned long parameter){
	struct block_buffer_node *node=((struct request_queue *)parameter)->in_using;
	if(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_ERROR){
		printk(RED,BLACK,"write_handler: %x\n",io_in8(PORT_DISK0_ERR_FEATURE));
	}
	end_request(node);
}

void other_handler(unsigned long nr, unsigned long parameter){
	struct block_buffer_node * node=((struct request_queue *)parameter)->in_using;

	if(io_in8(PORT_DISK0_STATUS_CMD) & DISK_STATUS_ERROR)
		printk(RED,BLACK,"other_handler:%x\n",io_in8(PORT_DISK0_ERR_FEATURE));
	else
		port_insw(PORT_DISK0_DATA,node->buffer,256);

	end_request(node);
}

/*
Function to create block_buffer_node structure
*/
struct block_buffer_node *make_request(long cmd, unsigned long blocks, long count,\
	unsigned char *buffer){
		struct block_buffer_node *node=\
		(struct block_buffer_node*)kmalloc(sizeof(struct block_buffer_node),0);

		//list_init(&node->list);
		wait_queue_init(&node->wait_queue,current);

		switch(cmd){
			case ATA_READ_CMD:
				node->end_handler=read_handler;
				node->cmd=ATA_READ_CMD;
				break;

			case ATA_WRITE_CMD:
				node->end_handler=write_handler;
				node->cmd=ATA_WRITE_CMD;
				break;

			default:
				node->end_handler=other_handler;
				node->cmd=cmd;
				break;
		}
		node->LBA=blocks;
		node->count=count;
		node->buffer=buffer;
		node->qnum=query_num++;
		return node;
}
/*
Function to link each single block_buffer_node in to disk_request->queue_list
*/
void add_request(struct block_buffer_node *node){
	list_add_to_before(&disk_request.wait_queue_list.wait_list,&node->wait_queue.wait_list);
	disk_request.block_request_count++;
}
/*
Function to add block_buffer_node in to disk_request->queue_list
and write port 
*/
void submit(struct block_buffer_node *node){
	add_request(node);
	if(disk_request.in_using==NULL){
		cmd_out();
	}
}

void wait_for_finish(){
	current->state=TASK_UNINTERRUPTIBLE;
	schedule();
}

long IDE_open(){//TODO
	printk(BLACK,WHITE,"DISK0 Opened\n");
	return 1;
}

long IDE_close(){//TODO
	printk(BLACK,WHITE,"DISK0 Closed\n");
	return 1;
}

/*
Function to get disk identification info
*/
long IDE_ioctl(long cmd,long arg){
	struct block_buffer_node *node=NULL;
	
	if(cmd==GET_IDENTIFY_DISK_CMD){
		node=make_request(cmd,0,0,(unsigned char*)arg);
		submit(node);
		wait_for_finish();
		return 1;
	}
	
	return 0;
}
/*
Function handle sector transfer

cmd: ATA_READ_CMD or ATA_WRITE_CMD
blocks: LBA address
count: number of sectors
*buffer: Input/Output buffer address

*/
long IDE_transfer(long cmd, unsigned long blocks, long count, unsigned char *buffer){
	struct block_buffer_node *node=NULL;
	if(cmd==ATA_READ_CMD||cmd==ATA_WRITE_CMD){
		node=make_request(cmd,blocks,count,buffer);
		submit(node);
		wait_for_finish();
	}else{
		return 0;
	}
	return 1;
}

/*
Function to send disk operation signal (through port)
only send out command, disk will send in an interrupt signal if finished||fault
*/
long cmd_out(){
	//Pick block_buffer_node in disk_request and move it in to in_using
	wait_queue_T *wait_queue_tmp=phy2vir(container_of(\
		list_next(&disk_request.wait_queue_list.wait_list),wait_queue_T,wait_list));
	struct block_buffer_node *node=disk_request.in_using=container_of(\
		wait_queue_tmp,struct block_buffer_node,wait_queue);
	list_del(&disk_request.in_using->wait_queue.wait_list);
	disk_request.block_request_count--;

	while(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_BUSY){//wait if disk busy
		nop();
	}

	printk(RED,YELLOW,"[Disk cmd_out] LBA: %x Count: %x\n",node->LBA,node->count);
	switch(node->cmd){
		case ATA_WRITE_CMD:
			io_out8(PORT_DISK0_DEVICE,0x40);
			// 48 bits LBA address, should divide in to two part and send each of them
			io_out8(PORT_DISK0_ERR_FEATURE,0);
			io_out8(PORT_DISK0_SECTOR_CNT,	(node->count>>8)	&0xff);
			io_out8(PORT_DISK0_SECTOR_LOW,	(node->LBA>>24)		&0xff);
			io_out8(PORT_DISK0_SECTOR_MID,	(node->LBA>>32)		&0xff);
			io_out8(PORT_DISK0_SECTOR_HIGH,	(node->LBA>>40)		&0xff);

			io_out8(PORT_DISK0_ERR_FEATURE,0);
			io_out8(PORT_DISK0_SECTOR_CNT,	(node->count)		&0xff);
			io_out8(PORT_DISK0_SECTOR_LOW,	(node->LBA)			&0xff);
			io_out8(PORT_DISK0_SECTOR_MID,	(node->LBA>>8)		&0xff);
			io_out8(PORT_DISK0_SECTOR_HIGH,	(node->LBA>>16)		&0xff);

			//if disk not ready, wait
			while(!(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_READY)){
				nop();
			}
			io_out8(PORT_DISK0_STATUS_CMD,node->cmd);
			//if disk not require for data, wait
			while(!(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_REQ)){
				nop();
			}
			port_outsw(PORT_DISK0_DATA,node->buffer,256);
			break;

		case ATA_READ_CMD:
			io_out8(PORT_DISK0_DEVICE,0x40);

			io_out8(PORT_DISK0_ERR_FEATURE,0);
			io_out8(PORT_DISK0_SECTOR_CNT,	(node->count>>8)	&0xff);
			io_out8(PORT_DISK0_SECTOR_LOW,	(node->LBA>>24)		&0xff);
			io_out8(PORT_DISK0_SECTOR_MID,	(node->LBA>>32)		&0xff);
			io_out8(PORT_DISK0_SECTOR_HIGH,	(node->LBA>>40)		&0xff);

			io_out8(PORT_DISK0_ERR_FEATURE,0);
			io_out8(PORT_DISK0_SECTOR_CNT,	(node->count)		&0xff);
			io_out8(PORT_DISK0_SECTOR_LOW,	(node->LBA)			&0xff);
			io_out8(PORT_DISK0_SECTOR_MID,	(node->LBA>>8)		&0xff);
			io_out8(PORT_DISK0_SECTOR_HIGH,	(node->LBA>>16)		&0xff);

			//if disk not ready, wait
			while(!io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_READY){
				nop();
			}
			io_out8(PORT_DISK0_STATUS_CMD,node->cmd);
			break;

		default:
			printk(BLACK,WHITE,"ATA CMD ERROR\n");
			break;
	}
}


/*
Functions defined to handle disk operation
*/
struct block_device_operation IDE_device_operation={
	.open=IDE_open,
	.close=IDE_close,
	.ioctl=IDE_ioctl,
	.transfer=IDE_transfer,
};

//Interrupt handler program for disk
void disk_handler(unsigned long nr, unsigned long parameter, struct pt_regs *regs){
    struct block_buffer_node *node=((struct request_queue*)parameter)->in_using;
	node->end_handler(nr,parameter);//call end_handler() for disk
}

/*
Function to:
initialize APIC RTE register for hdd
&& set up interrupt handler for disk
&& initialize disk request queue
*/
void disk_init(){
	unsigned char a[512];
    struct IO_APIC_RET_entry entry;
    
    entry.vector=0x2e;
	entry.deliver_mode=APIC_ICR_IOAPIC_Fixed ;
	entry.dest_mode=ICR_IOAPIC_DELV_PHYSICAL;
	entry.deliver_status=APIC_ICR_IOAPIC_Idle;
	entry.polarity=APIC_IOAPIC_POLARITY_HIGH;
	entry.irr=APIC_IOAPIC_IRR_RESET;
	entry.trigger=APIC_ICR_IOAPIC_Edge;
	entry.mask=APIC_ICR_IOAPIC_Masked;
	entry.reserved=0;

	entry.destination.physical.reserved1=0;
	entry.destination.physical.phy_dest=0;
	entry.destination.physical.reserved2=0;

	register_irq(0x2e, &entry, &disk_handler, (unsigned long)&disk_request, \
		&disk_int_controller, "disk0");

	io_out8(PORT_DISK0_ALT_STA_CTL,0);
	
	//list_init(&disk_request.queue_list);
	wait_queue_init(&disk_request.wait_queue_list,NULL);
	disk_request.in_using=NULL;
	disk_request.block_request_count=0;
	
	//disk_flags=0;
}

void disk_exit(){
    unregister_irq(0x2f);
}