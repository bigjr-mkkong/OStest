#ifndef __SPINLOCK_H__
#define __SPINLOCK_H__

typedef struct {
    __volatile__ unsigned long lock;    //1:unlock ; 0:lock
}spinlock_T;

void spin_init(spinlock_T *lock);
void spin_lock(spinlock_T *lock);
void spin_unlock(spinlock_T *lock);

#endif