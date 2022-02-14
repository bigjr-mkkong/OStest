#ifndef __SMP_H__
#define __SMP_H__

#include "spinlock.h"

#define SMP_cpu_id() (current->cpu_id)

void SMP_init();
spinlock_T SMP_lock;

#endif