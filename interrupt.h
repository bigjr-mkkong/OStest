#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

#include "linkage.h"
#include "printk.h"
#include "lib.h"

extern void (* interrupt[24])(void);

//extern void do_IRQ(struct pt_regs * regs,unsigned long nr);

#endif