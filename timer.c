#include "timer.h"
#include "interrupt.h"
#include "printk.h"
#include "softirq.h"

void do_timer(void *data){
    printk(BLACK,WHITE,"HPET_counter: %x\n",HPET_counter);
}

void timer_init(){
    HPET_counter=0;
    register_softirq(0,&do_timer,NULL);
}