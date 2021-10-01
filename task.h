#ifndef __TASK_H__
#define __TASK_H__

#include "ptrace.h"
#include "cpu.h"
#include "memory.h"
#include "lib.h"

struct task_struct{
	struct List list;
	volatile long state;
	unsigned long state;

	struct mm_struct *mm;
}

#endif