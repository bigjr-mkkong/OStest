#ifndef __SOFTIRQ_H__
#define __SOFTIRQ_H__

#define SOFTIRQ_NUM     64 //equal to the size of softirq_status

#define TIMER_SIRQ  (1<<0)

unsigned long softirq_status=0;

typedef struct softirq{
    void (*action)(void *data);
    void *data;
}softirq;

softirq softirq_vectors[SOFTIRQ_NUM];


void set_softirq_status(unsigned long status);
unsigned long get_softirq_status();
void register_softirq(int nr, void (*action)(void *data),void *data);
void unregister_softirq(int nr);
void softirq_init();

#endif