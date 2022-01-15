#ifndef __SMP_H__
#define __SMP_H__

#include "spinlock.h"

void SMP_init();
spinlock_T SMP_lock;

#endif