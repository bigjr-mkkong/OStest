#include "timer.h"
#include "interrupt.h"
#include "printk.h"
#include "softirq.h"
#include "lib.h"
#include "memory.h"

void do_timer(void *data){
    //printk(BLACK,WHITE,"HPET_counter: %x\n",HPET_counter);
    struct timer_list *tmp=container_of\
        (list_next(&timer_list_head.list),struct timer_list,list);

    while((!list_is_empty(timer_list_head.list))&&(tmp->expired_jiffies<=HPET_counter)){
        del_timer(tmp);
        tmp->func(tmp->data);
        tmp=container_of(list_next(&tmp->list),struct timer_list,list);
    }
    //printk(BLACK,WHITE,"HPET_counter: %x\n",HPET_counter);
}

void test_timer(){
    printk(BLACK,WHITE,"test_timer()\n");
}

void timer_init(){
    struct timer_list *tmp=NULL;
    HPET_counter=0;
    init_new_timer(&timer_list_head,NULL,NULL,-1UL);
    register_softirq(0,&do_timer,NULL);

    tmp=(struct timer_list*)kmalloc(sizeof(struct timer_list),0);
    init_new_timer(tmp,&test_timer,NULL,100);
    add_timer(tmp);
}

void init_new_timer(struct timer_list *timer, void (*func)(void *data),void *data,\
    unsigned long expired_jiffies){
    
    list_init(&timer->list);
    timer->data=data;
    timer->func=func;
    timer->expired_jiffies=expired_jiffies+HPET_counter;
    //HPET_counter+1 (roughly)== (1/20)*1 sec
}

void add_timer(struct timer_list *timer){
    struct timer_list *tmp=container_of(\
    list_next(&timer_list_head.list),struct timer_list,list);
    
    if(list_is_empty(tmp->list)){
        list_add_to_behind(&tmp->list,&timer->list);
    }else{
        while(tmp->expired_jiffies<timer->expired_jiffies){
            tmp=container_of(list_next(&tmp->list),struct timer_list,list);
        }
        list_add_to_behind(&tmp->list,&timer->list);
    }
}

void del_timer(struct timer_list *timer){
    list_del(timer->list);
}