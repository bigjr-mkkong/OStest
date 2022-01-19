#ifndef __TIMER_C__
#define __TIMER_C__
#include "lib.h"

struct timer_list{
    struct List list;
    unsigned long expired_jiffies;
    void (*func)(void *data);
    void *data;
};

struct timer_list timer_list_head;

unsigned long volatile HPET_counter=0;//HPET_counter++ everytime when HPET_handler called

void timer_init();
void init_new_timer(struct timer_list *timer, void (*func)(void *data),void *data,\
    unsigned long expired_jiffies);
void add_timer(struct timer_list *timer);
void del_timer(struct timer_list *timer);

#endif