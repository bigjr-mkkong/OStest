#include "atomic.h"

void atomic_addition(atomic_T *atomic, long value){
    __asm__ __volatile__(
        "lock addq %1,%0"
        :"=m"(atomic)
        :"r"(value)
        :"memory"
    );
}

void atomic_sub(atomic_T *atomic, long value){
    __asm__ __volatile__(
        "lock subq %1,%0"
        :"=m"(atomic)
        :"r"(value)
        :"memory"
    );
}

void atomic_inc(atomic_T *atomic){
    __asm__ __volatile__(
        "lock incq %0"
        :"=m"(atomic)
        :
        :"memory"
    );
}

void atomic_dec(atomic_T *atomic){
    __asm__ __volatile__(
        "lock decq %0"
        :"=m"(atomic)
        :
        :"memory"
    );
}

void atomic_set_mask(atomic_T *atomic,long mask){
    __asm__ __volatile__(
        "lock orq %1,%0"
        :"=m"(atomic->value)
        :"r"(mask)
        :"memory"
    );
}

void atomic_clear_mask(atomic_T *atomic,long mask){
    __asm__ __volatile__(
        "lock andq %1,%0"
        :"=m"(atomic->value)
        :"r"(~(mask))
        :"memory"
    );
}