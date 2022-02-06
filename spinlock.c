#include "spinlock.h"
#include "task.h"

void spin_init(spinlock_T *lock){
    lock->lock=1;
}

void spin_lock(spinlock_T *lock){
    current->spin_counter++;
    __asm__ __volatile__(
        "LOCK_UP:           \n\t"
        "lock decq %0       \n\t"
        "jns WIN            \n\t"
        "TRY:               \n\t"
        "pause              \n\t"
        "cmpq $0,%0         \n\t"
        "jle TRY            \n\t"
        "jmp LOCK_UP        \n\t"
        "WIN:               \n\t"
        :"=m"(lock->lock)
        :
        :"memory"
    );
}

void spin_unlock(spinlock_T *lock){
    lock->lock=1;
    current->spin_counter--;
}
