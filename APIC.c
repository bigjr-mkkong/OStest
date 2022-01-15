#include "interrupt.h"
#include "linkage.h"
#include "lib.h"
#include "printk.h"
#include "memory.h"
#include "gate.h"
#include "ptrace.h"
#include "cpu.h"
#include "APIC.h"

unsigned long ioapic_rte_read(unsigned char index){
	unsigned long ret;

	*ioapic_map.vir_index_addr=index+1;
	io_mfence();
	ret=*ioapic_map.vir_data_addr;
	ret<<=32;
	io_mfence();

	*ioapic_map.vir_index_addr=index;
	io_mfence();
	ret|=*ioapic_map.vir_data_addr;
	io_mfence();

	return ret;
}

void ioapic_rte_write(unsigned char index, unsigned long value){
	*ioapic_map.vir_index_addr=index;
	io_mfence();
	*ioapic_map.vir_data_addr=value&0xffffffff;
	value>>32;
	io_mfence();

	*ioapic_map.vir_index_addr=index+1;
	io_mfence();
	*ioapic_map.vir_data_addr=value&0xffffffff;
	io_mfence();
}

void IOAPIC_enable(unsigned long irq){
	unsigned long value=0;
	value=ioapic_rte_read((irq-32)*2+0x10);
	value=value&(~0x10000UL); 
	ioapic_rte_write((irq-32)*2+0x10,value);
}

void IOAPIC_disable(unsigned long irq){
	unsigned long value=0;
	value=ioapic_rte_read((irq-32)*2+0x10);
	value=value|0x10000UL; 
	ioapic_rte_write((irq-32)*2+0x10,value);
}

unsigned long IOAPIC_install(unsigned long irq,void*arg){
	struct IO_APIC_RET_entry *entry=(struct IO_APIC_RET_entry*)arg;
	ioapic_rte_write((irq-32)*2+0x10,*(unsigned long*)entry);
	return 1;
}

void IOAPIC_uninstall(unsigned long irq){
	ioapic_rte_write((irq-32)*2+0x10,0x10000UL);
}

void IOAPIC_level_ack(unsigned long irq){
	__asm__ __volatile__(	
				"movq $0x00, %%rdx	\n\t"
				"movq $0x00, %%rax	\n\t"
				"movq  $0x80b, %%rcx	\n\t"
				"wrmsr	\n\t"
				:::"memory");
	*ioapic_map.vir_EOI_addr=irq;
}

void IOAPIC_edge_ack(unsigned long irq){
	__asm__ __volatile__(	
				"movq $0x00, %%rdx	\n\t"
				"movq $0x00, %%rax	\n\t"
				"movq  $0x80b, %%rcx	\n\t"
				"wrmsr \n\t"
				:::"memory");
}

void Local_APIC_edge_level_ack(unsigned long irq){
	__asm__ __volatile__(	
				"movq $0x00,%%rdx	\n\t"
				"movq $0x00,%%rax	\n\t"
				"movq $0x80b,%%rcx	\n\t"
				"wrmsr				\n\t"
				:::"memory");
}

void local_APIC_init(){
	unsigned int x,y;
	unsigned int a,b,c,d;

	get_cpuid(1,0,&a,&b,&c,&d);

	if((1<<9)&d){
		printk(WHITE,BLACK,"Support APIC and xAPIC\n");
	}else{
		printk(WHITE,BLACK,"Do not support APIC and xAPIC\n");
	}

	if((1<<21)&c){
		printk(WHITE,BLACK,"Support x2APIC\n");
	}else{
		printk(WHITE,BLACK,"Do not support x2APIC\n");
	}
	/*
	enable xAPIC and x2APIC
	address of the reg IA32_APIC_BASE in MSR: 0x1b
	*/
	x=y=0;
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0xc00,%%rax	\n\t"
		"wrmsr			\n\t"
		:
		:
		:"memory");
	
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);

	if(x&0xc00){
		printk(WHITE,BLACK,"xAPIC and x2APIC enabled\n");
	}
	/*
	Enable local APIC
	address of SVR in MSR: 0x80f
	address of 
	"seems like pentium 4 do not support EOI Broadcast Disable function,
	so here I only enabled local apic"
	*/
	__asm__ __volatile__(
		"movq $0x80f,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0x1100,%%rax	\n\t"
		"wrmsr			\n\t"
		:
		:
		:"memory");
	/*
	Get x2apic id
	address of Local APIC ID Register in MSR: 0x802
	*/
	__asm__ __volatile__(
		"movq $0x802,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);
	printk(WHITE,BLACK,"x2APIC_ID: %x\n",x);

	/*
	Get Local APIC version
	address of Local APIC ID Register in MSR: 0x803
	*/
	__asm__ __volatile__(
		"movq $0x803,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);
	printk(WHITE,BLACK,"Local APIC Version: %x\n",x&(0xff));
	printk(WHITE,BLACK,"Max LVT Entry: %x\n",(x>>16&0xff)+1);
	printk(WHITE,BLACK,"Support SVR[12](EOI Broadcast Disable Function)?: %s\n",\
		(x>>24&0x01)==0?"No":"Yes");

//mask all IVT
	__asm__ __volatile__(
		/*
		Pentium 4 do not support CMCI funciton, so the code below will cause a
		general proteciton fault:

		"movq $0x82f,%%rcx	\n\t"
		"wrmsr				\n\t"
		whether support CMCI function or not can be evaluate in IA32_MCG_CAP[10]
		*/
		"movq $0x832,%%rcx	\n\t"//mask LVT Timer register 
		"wrmsr				\n\t"
		"movq $0x833,%%rcx	\n\t"//mask LVT Thermal Sensor register
		"wrmsr				\n\t"
		"movq $0x834,%%rcx	\n\t"//mask LVT Performance Monitoring register
		"wrmsr				\n\t"
		"movq $0x835,%%rcx	\n\t"//mask LVT LINT0 register
		"wrmsr				\n\t"
		"movq $0x836,%%rcx	\n\t"//mask LVT LINT1 register
		"wrmsr				\n\t"
		"movq $0x837,%%rcx	\n\t"//mask LVT Error register
		"wrmsr				\n\t"
		:
		:"a"(0x10000),"d"(0x00)
		:"memory"
		);
	printk(WHITE,BLACK,"LVT Masked\n");
}

void IOAPIC_pagetab_init(){
	unsigned long *tmp;
	unsigned char *IOAPIC_addr=(unsigned char*)phy2vir(0xfec00000);

	ioapic_map.phy_addr=0xfec00000;
	ioapic_map.vir_index_addr=IOAPIC_addr;
	ioapic_map.vir_data_addr=(unsigned int*)(IOAPIC_addr+0x10);
	ioapic_map.vir_EOI_addr=(unsigned int*)(IOAPIC_addr+0x40);

	Global_CR3=Get_gdt();

	tmp=phy2vir(Global_CR3+(((unsigned long)IOAPIC_addr>>PAGE_GDT_SHIFT)&0x1ff));
	if(*tmp==0){
		unsigned long* vir=kmalloc(PAGE_4K_SIZE,0);
		set_mpl4t(tmp,mk_mpl4t(vir2phy(vir),PAGE_KERNEL_GDT));
	}

	tmp=phy2vir((unsigned long*)(*tmp&(~0xfffUL))+\
		(((unsigned long)IOAPIC_addr>>PAGE_1G_SHIFT)&0x1ff));
	if(*tmp==0){
		unsigned long *vir=kmalloc(PAGE_4K_SIZE,0);
		set_pdpt(tmp,mk_pdpt(vir2phy(vir),PAGE_KERNEL_Dir));
	}

	tmp=phy2vir((unsigned long*)(*tmp&(~0xfffUL))+\
		(((unsigned long)IOAPIC_addr>>PAGE_2M_SHIFT)&0x1ff));
	set_pdt(tmp,mk_pdt(ioapic_map.phy_addr,PAGE_KERNEL_Page|PAGE_PWT|PAGE_PCD));

	flush_tlb();
}

void IOAPIC_init(){
	*ioapic_map.vir_index_addr=0x00;
	io_mfence();
	*ioapic_map.vir_data_addr=0x0f000000;
	io_mfence();
	printk(GREEN,BLACK,"Get IO APIC ID Reg: %x, ID: %x\n",*ioapic_map.vir_data_addr,\
		*ioapic_map.vir_data_addr>>24&0xf);
	io_mfence();

	*ioapic_map.vir_index_addr=0x01;
	io_mfence();
	printk(GREEN,BLACK,"IO APIC Version: %x, MAX redirection entries: %d\n",\
		*ioapic_map.vir_data_addr,((*ioapic_map.vir_data_addr>>16)&0xff)+1);

	for(int i=0x10;i<0x40;i+=2){
		ioapic_rte_write(i,0x10020+((i-0x10)>>1));
	}

	ioapic_rte_write(0x12,0x21);

	printk(GREEN,BLACK,"IOAPIC redirection table set finished\n");
}

void APIC_IOAPIC_init(){
	unsigned int x;
	unsigned int *p;

	IOAPIC_pagetab_init();

	for(int i=32;i<56;i++){
		set_intr_gate(i,0,interrupt[i-32]);
	}

	//mask 8259a
	printk(GREEN,BLUE,"Mask 8259A\n");
	io_out8(0x21,0xff);
	io_out8(0xa1,0xff);

	//enable IMCR
	io_out8(0x22,0x70);
	io_out8(0x23,0x01);

	local_APIC_init();

	IOAPIC_init();

	memset(interrupt_desc,0,sizeof(irq_desc_T)*NR_IRQS);
	sti();
}

void do_IRQ(struct pt_regs *regs,unsigned long nr){ //regs:rsp,nr
	switch (nr&0x80){
		case 0x00:
			{
				irq_desc_T *irq=&interrupt_desc[nr-32];
				if(irq->handler!=NULL){
					irq->handler(nr,irq->parameter,regs);
				}

				if(irq->controller!=NULL&&irq->controller->ack!=NULL){
					irq->controller->ack(nr);
				}
			}
			break;
		
		case 0x80:
			printk(RED,BLACK,"SMP IPI: %x\n",nr);
			Local_APIC_edge_level_ack(nr);
			break;

		default:
			printk(RED,BLACK,"do_irq() received %x\n",nr);
		break;
	}
}
