#ifndef __SEMAPHORE_H__
#define __SEMAPHORE_H__

#include "lib.h"
#include "atomic.h"
#include "task.h"
#include "schedule.h"

/*
lock some resources, when task are going to access a system resources

when counter>0, current can accerss to certain resources normally
when counter<=0, current will be halted and put in to wait queue(set state in to UNINTERRUPTABLE and schedule away)
*/

typedef struct{
    List wait_list;
    struct task_struct *tsk;    
}wait_queue_T;


typedef struct{
    atomic_T counter;//when counter==0, new task are going to put in to wait queue
    wait_queue_T wait;
}semaphore_T;

void semaphore_wait(semaphore_T *semaphore);
void semaphore_post(semaphore_T *semaphore);
void semaphore_init(semaphore_T *semaphore,unsigned long count);

#endif