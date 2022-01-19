#include "softirq.h"
#include "lib.h"

void set_softirq_status(unsigned long status){
    softirq_status=status;
}

unsigned long get_softirq_status(){
    return softirq_status;
}

void register_softirq(int nr, void (*action)(void *data),void *data){
    softirq_vectors[nr].action=action;
    softirq_vectors[nr].data=data;
}

void unregister_softirq(int nr){
    softirq_vectors[nr].action=NULL;
    softirq_vectors[nr].action=NULL;
}

void softirq_init(){
    softirq_status=0;
    memset(softirq_vectors,0,SOFTIRQ_NUM*sizeof(softirq));
}

void do_softirq(){
    sti();
    for(int i=0;i<64&&softirq_status;i++){
        if(softirq_status&(1<<i)){
            softirq_vectors[i].action(softirq_vectors[i].data);
            softirq_status&=~(1<<i);
        }
    }
    cli();
}