#include "interrupt.h"
#include "linkage.h"
#include "lib.h"
#include "printk.h"
#include "memory.h"
#include "gate.h"
#include "ptrace.h"
#include "cpu.h"
#include "APIC.h"

void local_APIC_init(){
	unsigned int x,y;
	unsigned int a,b,c,d;

	get_cpuid(1,0,&a,&b,&c,&d);

	if((1<<9)&d){
		printk(WHITE,BLACK,"Support APIC and xAPIC\n");
	}else{
		printk(WHITE,BLACK,"Do not support APIC and xAPIC\n");
	}

	if((1<<21)&c){
		printk(WHITE,BLACK,"Support x2APIC\n");
	}else{
		printk(WHITE,BLACK,"Do not support x2APIC\n");
	}
	/*
	enable xAPIC and x2APIC
	address of the reg IA32_APIC_BASE in MSR: 0x1b

	PROBLEM: after remove the annotation symbol before the second wrmsr,
	system will throw a general protection fault with error code 0xe0
	*/
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0xc00,%%rax	\n\t"
		"wrmsr			\n\t"
		//"wrmsr	\n\t"
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory");
	
	if(x&0xc00){
		printk(WHITE,BLACK,"xAPIC and x2APIC enabled\n");
	}

}

void do_IRQ(struct pt_regs *regs,unsigned long nr){ //regs:rsp,nr

}
