#include "printk.h"
#include "lib.h"
#include "memory.h"
#include "APIC.h"
#include "interrupt.h"
#include "time.h"
#include "timer.h"
#include "softirq.h"
#include "task.h"
#include "schedule.h"

extern struct time t;

hw_int_controller HPET_int_controller = 
{
	.enable = IOAPIC_enable,
	.disable = IOAPIC_disable,
	.install = IOAPIC_install,
	.uninstall = IOAPIC_uninstall,
	.ack = IOAPIC_edge_ack,
};

void HPET_handler(unsigned long nr, unsigned long parameter, struct pt_regs *regs){
    HPET_counter++;
    struct timer_list *tmp=phy2vir(container_of(list_next(&timer_list_head.list),struct timer_list,list));
    if(tmp->expired_jiffies<=HPET_counter){
        set_softirq_status(TIMER_SIRQ);
    }
    switch(current->priority){
        case 0:
        case 1:
            task_schedule.CPU_exec_task_jiffies--;
            current->vir_runtime++;
            break;

        case 2:
        default:
            task_schedule.CPU_exec_task_jiffies-=2;
            current->vir_runtime+=2;
            break;
    }
    if(task_schedule.CPU_exec_task_jiffies<=0){
        current->flags|=NEED_SCHEDULE;
    }
}

void HPET_init(){
    unsigned long *HPET_addr = (unsigned long *)phy2vir(0xfed00000);
    struct IO_APIC_RET_entry entry;

    entry.vector=0x22;
    entry.deliver_mode=APIC_ICR_IOAPIC_Fixed;
    entry.dest_mode=ICR_IOAPIC_DELV_PHYSICAL;
    entry.deliver_status=APIC_ICR_IOAPIC_Idle;
    entry.polarity=APIC_IOAPIC_POLARITY_HIGH;
    entry.irr=APIC_IOAPIC_IRR_RESET;
    entry.trigger=APIC_ICR_IOAPIC_Edge;
    entry.mask=APIC_ICR_IOAPIC_Masked;
    entry.reserved=0;

    entry.destination.physical.reserved1=0;
    entry.destination.physical.reserved2=0;
    entry.destination.physical.phy_dest=0;

    register_irq(0x22,&entry,&HPET_handler,NULL,&HPET_int_controller, "HPET");

    *(unsigned long*)(HPET_addr+0x10)=3;
    io_mfence();
    *(unsigned long*)(HPET_addr+0x100)=0x4c;
    io_mfence();
    *(unsigned long*)(HPET_addr+0x108)=0xda7a63;
    io_mfence();
    get_cmos_time(&t);
    *(unsigned long*)(HPET_addr+0xf0)=0;
    io_mfence();

    printk(GREEN,PURPLE,"Date: %x/%x/%x\n",t.year,t.month,t.day);
}