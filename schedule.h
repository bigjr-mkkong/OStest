#ifndef __SCHEDULE_H__
#define __SCHEDULE_H__

#include "lib.h"
#include "task.h"
#include "timer.h"

struct schedule{
    long running_task_count;
    long CPU_exec_task_jiffies;//number of time slot next task can has
    struct task_struct task_queue;
};

struct schedule task_schedule[NR_CPUS];

void schedule_init();
void schedule();
void insert_task_queue(struct task_struct *tsk);
struct task_struct *get_next_task();

#endif