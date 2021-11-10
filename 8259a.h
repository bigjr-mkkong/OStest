#ifndef __8259a_H__
#define __8259a_H__

#include "linkage.h"
#include "ptrace.h"

extern void (*interrupt[24])(void);
extern void do_IRQ(struct pt_regs *regs,unsigned long nr);

#endif
