#include "SMP.h"
#include "lib.h"
#include "printk.h"
#include "gate.h"
#include "interrupt.h"
#include "task.h"
#include "schedule.h"

extern unsigned char APU_boot_start[];
extern unsigned char APU_boot_end[];
extern int global_i;

void IPI_0x200(unsigned long nr, unsigned long parameter, struct pt_regs *regs){
    switch(current->priority){
		case 0:
		case 1:
			task_schedule[SMP_cpu_id()].CPU_exec_task_jiffies--;
			current->vir_runtime+=1;
			break;
		case 2:
		default:
			task_schedule[SMP_cpu_id()].CPU_exec_task_jiffies-=2;
			current->vir_runtime+=2;
			break;
	}
	if(task_schedule[SMP_cpu_id()].CPU_exec_task_jiffies<=0)
		current->flags|=NEED_SCHEDULE;
}

void SMP_init(){
    unsigned int a,b,c,d;
    for(int i=0;;i++){
        get_cpuid(0xb,i,&a,&b,&c,&d);
        if((c>>8&0xff)==0) break;
        
        if((c>>8&0xff)==1){
            printk(WHITE,BLACK,"Type: SMT ID  ");
        }else if((c>>8&0xff)==2){
            printk(WHITE,BLACK,"Type: Core ID ");
        }
        printk(WHITE,BLACK,"Width: %x number of logical processor: %x\n",a&0x1f,b&0xff);
    }
    printk(WHITE,BLACK,"SMP(): copy bytes: %x\n",(unsigned long)&APU_boot_end-(unsigned long)&APU_boot_start);
    memcpy(APU_boot_start,\
    (unsigned char*)0xffff800000020000,\
    (unsigned long)&APU_boot_end-(unsigned long)&APU_boot_start);
    spin_init(&SMP_lock);
    
    for(int i=200;i<210;i++){
        set_intr_gate(i,0,SMP_interrupt[i-200]);
    }
    memset(SMP_IPI_desc,0,sizeof(irq_desc_T)*10);
    register_IPI(200,NULL,&IPI_0x200,NULL,NULL,"IPI 0x200");
}

void Start_SMP(){//rsp==0x1620000
    unsigned long x,y;
    printk(BLACK,WHITE,"APU[%x] Started\n",global_i-1);
    
    //enable xAPIC and x2APIC for APU
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
		printk(WHITE,BLACK,"APU: xAPIC and x2APIC enabled\n");
	}

    //enable SVR[8] and SVR[12] for APU
    __asm__ __volatile__(
		"movq $0x80f,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0x1100,%%rax	\n\t"
		"wrmsr			    \n\t"
        "movq $0x80f,%%rcx  \n\t"
        "rdmsr"
		:"=a"(x),"=d"(y)
		:
		:"memory");

    if(x&0x100){
        printk(WHITE,BLACK,"APU: SVR[8] enabled\n");
    }
    if(x&0x1000){
        printk(WHITE,BLACK,"APU: SVR[12] enabled\n");
    }

    //check x2APIC ID for APU
    __asm__ __volatile__(
		"movq $0x802,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);
	printk(WHITE,BLACK,"APU: x2APIC_ID: %x\n",x);
    current->state=TASK_RUNNING;
    current->flags=PF_KTHREAD;
    current->mm=&init_mem;

    list_init(&current->list);
    current->addr_limit=0xffff800000000000;
    current->priority=2;
    current->vir_runtime=0;

    current->thread=(struct thread_struct*)(current+1);
    memset(current->thread,0,sizeof(struct thread_struct));
    current->thread->rsp0=_stack_start;
    current->thread->rsp=_stack_start;
    current->thread->fs=KERNEL_DS;
    current->thread->gs=KERNEL_DS;
    init_task[SMP_cpu_id()]=current;

    load_TR(10+(global_i-1)*2);
    spin_unlock(&SMP_lock);
    current->spin_counter=0;
    sti();
    
    task_init();
    
    while(1){
        hlt();
    }
}//10d91c