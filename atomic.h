#ifndef __ATOMIC_H__
#define __ATOMIC_H__

#include "lib.h"
typedef struct{
    __volatile__ long value;
}atomic_T;

void atomic_addition(atomic_T *atomic, long value);
void atomic_sub(atomic_T *atomic, long value);
void atomic_inc(atomic_T *atomic);
void atomic_dec(atomic_T *atomic);

#endif