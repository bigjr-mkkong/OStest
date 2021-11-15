#include "interrupt.h"
#include "linkage.h"
#include "lib.h"
#include "printk.h"
#include "memory.h"
#include "gate.h"
#include "ptrace.h"

void init_i8295(){
	for(int i=32;i<56;i++){
		set_intr_gate(i,2,interrupt[i-32]);
	}

	printk(RED,BLACK,"8259A init \n");

	//master ICW1-4
	io_out8(0x20,0x11);
	io_out8(0x21,0x20);
	io_out8(0x21,0x04);
	io_out8(0x21,0x01);

	//slave ICW1-4
	io_out8(0xa0,0x11);
	io_out8(0xa1,0x28);
	io_out8(0xa1,0x02);
	io_out8(0xa1,0x01);

	//8259A-M/S	OCW1
	io_out8(0x21,0xfd);
	io_out8(0xa1,0xff);

	sti();
}

void do_IRQ(unsigned long regs,unsigned long nr){//regs:rsp,nr
	unsigned char x=io_in8(0x60);
	printk(RED,BLACK,"key code:%x",x);
	io_out8(0x20,0x20);
}