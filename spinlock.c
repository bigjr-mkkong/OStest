#include "spinlock.h"

void spin_init(spinlock_T *lock){
    lock->lock=1;
}

void spin_lock(spinlock_T *lock){
    __asm__ __volatile__(
        "1:             \n\t"
        "lock decq %0   \n\t"
        "jns 3f         \n\t"
        "2:             \n\t"
        "pause          \n\t"
        "cmpq $0,%0     \n\t"
        "jle 2b         \n\t"
        "jmp 1b         \n\t"
        "3:             \n\t"
        :"=m"(lock->lock)
        :
        :"memory"
    );
}

void spin_unlock(spinlock_T *lock){
    __asm__ __volatile__(
        "movq $1,%0     \n\t"
        :"=m"(lock->lock)
        :
        :"memory"
    );
}
