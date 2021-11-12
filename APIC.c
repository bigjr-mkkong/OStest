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
	*/
	x=y=0;
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0xc00,%%rax	\n\t"
		"wrmsr			\n\t"
		:
		:
		:"memory");
	
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);

	if(x&0xc00){
		printk(WHITE,BLACK,"xAPIC and x2APIC enabled\n");
	}
	/*
	Enable local APIC
	address of SVR in MSR: 0x80f
	address of 
	"seems like pentium 4 do not support EOI Broadcast Disable function,
	so here I only enabled local apic"
	*/
	__asm__ __volatile__(
		"movq $0x80f,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0x100,%%rax	\n\t"
		"wrmsr			\n\t"
		:
		:
		:"memory");
	/*
	Get x2apic id
	address of Local APIC ID Register in MSR: 0x802
	*/
	__asm__ __volatile__(
		"movq $0x802,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);
	printk(WHITE,BLACK,"x2APIC_ID: %x\n",x);

	/*
	Get Local APIC version
	address of Local APIC ID Register in MSR: 0x803
	*/
	__asm__ __volatile__(
		"movq $0x803,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);
	printk(WHITE,BLACK,"Local APIC Version: %x\n",x&(0xff));
	printk(WHITE,BLACK,"Max LVT Entry: %x\n",(x>>16&0xff)+1);
	printk(WHITE,BLACK,"Support SVR[12](EOI Broadcast Disable Function)?: %s\n",\
		(x>>24&0x01)==0?"No":"Yes");


}

void do_IRQ(struct pt_regs *regs,unsigned long nr){ //regs:rsp,nr

}
