#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

#include "linkage.h"
#include "printk.h"
#include "lib.h"

void init_interrupt();
void do_IRQ(unsigned long regs,unsigned long nr);

#endif