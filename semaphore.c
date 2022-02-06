#include "semaphore.h"

void wait_queue_init(wait_queue_T *wait_queue,struct task_struct *tsk){
    list_init(&wait_queue->wait_list);
    wait_queue->tsk=tsk;
}

void semaphore_init(semaphore_T *semaphore,unsigned long count){
    atomic_set(&semaphore->counter,count);
    wait_queue_init(&semaphore->wait,NULL);

}

void add2wait(semaphore_T *semaphore){
    wait_queue_T wait;
    wait_queue_init(&wait,current);
    current->state=TASK_UNINTERRUPTIBLE;
    list_add_to_before(&semaphore->wait.wait_list,&wait.wait_list);
    schedule();
}

void semaphore_wait(semaphore_T *semaphore){
    if(atomic_read(&semaphore->counter)>0){
        atomic_dec(&semaphore->counter);
    }else{
        add2wait(semaphore);
    }
}

void pull_out_from_wait(semaphore_T *semaphore){
    wait_queue_T *wait=container_of(list_next(&semaphore->wait.wait_list),wait_queue_T,wait_list);
    list_del(&wait->wait_list);
    wait->tsk->state=TASK_RUNNING;
    insert_task_queue(wait->tsk);
}

void semaphore_post(semaphore_T *semaphore){
    if(list_is_empty(&semaphore->wait.wait_list)){
        atomic_inc(&semaphore->counter);
    }else{
        pull_out_from_wait(semaphore);
    }
}