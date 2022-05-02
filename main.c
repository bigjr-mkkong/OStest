#include "printk.h"
#include "gate.h"
#include "trap.h"
#include "lib.h"
#include "memory.h"
#include "interrupt.h"
#include "task.h"
#include "cpu.h"
#include "keyboard.h"
#include "mouse.h"
#include "disk.h"
#include "SMP.h"
#include "time.h"
#include "HPET.h"
#include "softirq.h"
#include "timer.h"
#include "schedule.h"
#include "fat32.h"

#define APIC	1	
#define CPUNUM	3

#if APIC
#include "APIC.h"
#else
#include "8259a.h"
#endif

struct Global_Memory_Descriptor mman_struct;
/*
mman_struct is a global memory control unit
*/
extern char _text;
extern char _etext;
extern char _edata;
extern char _end;

int global_i=0;

void Start_Kernel(void){
	struct INT_CMD_REG icr_entry;

	//setting screen infomatoin
	pos.Xresolution=1440;
	pos.Yresolution=900;
	pos.Xposition=pos.Yposition=0;
	pos.Xcharsize=8;
	pos.Ycharsize=16;
	pos.FB_addr=(int *)0xffff800003000000;
	pos.FB_len=(pos.Xresolution*pos.Yresolution*4+PAGE_4K_SIZE-1)&(PAGE_4K_MASK);
	spin_init(&pos.printk_lock);
	printk(WHITE,BLACK,"Kernel Started\n");
	//load TR with selector defined in GDT
	load_TR(10);
	set_tss64((unsigned int *)&init_tss[0],_stack_start,_stack_start,_stack_start, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00);
	set_sys_int();

	init_cpu();
	mman_struct.start_code=(unsigned long)&_text;
	mman_struct.end_code=(unsigned long)&_etext;
	mman_struct.end_data=(unsigned long)&_edata;
	mman_struct.end_brk=(unsigned long)&_end;

	init_mem();

	slab_init();

	unsigned char *ptr=(unsigned char *)kmalloc(STACK_SIZE,0)+STACK_SIZE;
	((struct task_struct*)(ptr-STACK_SIZE))->cpu_id=0;
	init_tss[0].ist1=(unsigned long)ptr;
	init_tss[0].ist2=(unsigned long)ptr;
	init_tss[0].ist3=(unsigned long)ptr;
	init_tss[0].ist4=(unsigned long)ptr;
	init_tss[0].ist5=(unsigned long)ptr;
	init_tss[0].ist6=(unsigned long)ptr;
	init_tss[0].ist7=(unsigned long)ptr;

	frame_buffer_init();

	pagetable_init();

	//printk(BLACK,WHITE,"\ntest test\n");//0c1047c0  call rdx ;rdx=0xffff8000_00108e5d
	//init_i8295();
	
	#if APIC
	APIC_IOAPIC_init();
	#else
	init_i8295();
	#endif

	printk(WHITE,BLACK,"Schedule Initializing...\n");
	schedule_init();

	printk(WHITE,BLACK,"Soft IRQ Initializing...\n");
	softirq_init();

	//task_init();
	printk(WHITE,BLACK,"Initializing keyboard driver...\n");
	keyboard_init();
	printk(WHITE,BLACK,"Initializing mouse driver...\n");
	mouse_init();

	printk(WHITE,BLACK,"Initializing disk driver...\n");
	disk_init();

	char buf[512];
	printk(PURPLE,BLACK,"disk write:\n");
	memset(buf,0x1,512);
	IDE_device_operation.transfer(ATA_WRITE_CMD,0x3,1,(unsigned char *)buf);

	printk(PURPLE,BLACK,"disk write end\n");

	printk(PURPLE,BLACK,"disk read:\n");
	memset(buf,0x0,512);
	IDE_device_operation.transfer(ATA_READ_CMD,0x3,1,(unsigned char *)buf);
	for(int i=0;i<512;i++){
		printk(YELLOW,BLACK,"%x ",buf[i]);
	}//Interrupt concurrency problem may appear here if there're no tasks(only Idle task) in the task queue
	printk(PURPLE,BLACK,"\ndisk read end\n");

	//DISK0_FAT32_FS_init();
	printk(WHITE,BLACK,"Initializing SMP...\n");
	SMP_init();//copy apu boot program to 0xffff800000020000
	//prepare INIT IPI
	icr_entry.vector=0x0;
	icr_entry.deliver_mode=APIC_ICR_IOAPIC_INIT;
	icr_entry.dest_mode=ICR_IOAPIC_DELV_PHYSICAL;
	icr_entry.deliver_status=APIC_ICR_IOAPIC_Idle;
	icr_entry.res_1=0;
	icr_entry.level=ICR_LEVEL_DE_ASSERT;
	icr_entry.trigger=APIC_ICR_IOAPIC_Edge;
	icr_entry.res_2=0;
	icr_entry.dest_shorthand=ICR_ALL_EXCLUDE_Self;
	icr_entry.res_3=0;
	icr_entry.destination.x2apic_destination=0x0;

	wrmsr(0x830,*(unsigned long*)&icr_entry);//Send INIT IPI
	
	//prepare StartUP IPI

	unsigned int *tss=NULL;
	for(global_i=1;global_i<CPUNUM;global_i++){
		spin_lock(&SMP_lock);
		ptr=(unsigned char*)kmalloc(STACK_SIZE,0);
		_stack_start=(unsigned long)ptr+STACK_SIZE;
		((struct task_struct*)ptr)->cpu_id=global_i;

		memset(&init_tss[global_i],0,sizeof(struct tss_struct));

		init_tss[global_i].rsp0=_stack_start;
		init_tss[global_i].rsp1=_stack_start;
		init_tss[global_i].rsp2=_stack_start;

		ptr=(unsigned char*)kmalloc(STACK_SIZE,0)+STACK_SIZE;
		((struct task_struct*)(ptr-STACK_SIZE))->cpu_id=global_i;

		init_tss[global_i].ist1=(unsigned long)ptr;
		init_tss[global_i].ist2=(unsigned long)ptr;
		init_tss[global_i].ist3=(unsigned long)ptr;
		init_tss[global_i].ist4=(unsigned long)ptr;
		init_tss[global_i].ist5=(unsigned long)ptr;
		init_tss[global_i].ist6=(unsigned long)ptr;
		init_tss[global_i].ist7=(unsigned long)ptr;

		set_tss_descriptor(10+global_i*2,&init_tss[global_i]);

		icr_entry.vector=0x20;
		icr_entry.deliver_mode=ICR_Start_up;
		icr_entry.dest_shorthand=ICR_No_Shorthand;
		icr_entry.destination.x2apic_destination=global_i;

		wrmsr(0x830,*(unsigned long*)&icr_entry);//Send StartUP IPI
		wrmsr(0x830,*(unsigned long*)&icr_entry);//Send StartUP IPI
	}

	//IPI sending test
	icr_entry.vector=0xc8;
	icr_entry.destination.x2apic_destination=1;
	icr_entry.deliver_mode=APIC_ICR_IOAPIC_Fixed;
	wrmsr(0x830,*(unsigned long*)&icr_entry);

	printk(WHITE,BLACK,"Time&Clock Initializing...\n");
	timer_init();
	HPET_init();
	printk(WHITE,BLACK,"Task Initializing...\n");
	task_init();
	sti();
	
	while(1){//10ffd1
		if(p_kb->count){
			analysis_keycode();
		}
		if(p_mouse->count){
			analysis_mousecode();
		}
	}
	
	while(1);
}
