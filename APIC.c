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

	printk(WHITE,BLACK,"CPUID 01:\neax: %x\nebx: %x\necx: %x\nedx: %x\n",a,b,c,d);

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
	return;
}

void do_IRQ(struct pt_regs *regs,unsigned long nr){ //regs:rsp,nr

}
