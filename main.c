#include "printk.h"
#include "gate.h"
#include "trap.h"
#include "memory.h"

struct Global_Memory_Descriptor memory_management_struct;

void Start_Kernel(void){
	pos.Xresolution=1440;
	pos.Yresolution=900;
	pos.Xposition=pos.Yposition=0;
	pos.Xcharsize=8;
	pos.Ycharsize=16;
	pos.FB_addr=(int *)0xffff800000a00000;
	pos.FB_len=4096;


	load_TR(8);

	set_tss64(0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00);
	set_sys_int();
	printk(GREEN,BLUE,"hello %x\n",1231);
	init_mem();
	while(1);
}
