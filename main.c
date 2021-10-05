#include "printk.h"
#include "gate.h"
#include "trap.h"
#include "lib.h"
#include "memory.h"
#include "interrupt.h"
#include "task.h"

struct Global_Memory_Descriptor mman_struct;
extern char _text;
extern char _etext;
extern char _edata;
extern char _end;

void Start_Kernel(void){
	pos.Xresolution=1440;
	pos.Yresolution=900;
	pos.Xposition=pos.Yposition=0;
	pos.Xcharsize=8;
	pos.Ycharsize=16;
	pos.FB_addr=(int *)0xffff800000a00000;
	pos.FB_len=(pos.Xresolution*pos.Yresolution*4+PAGE_4K_SIZE-1)&(PAGE_4K_MASK);


	load_TR(8);

	set_tss64(0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00);
	set_sys_int();

	mman_struct.start_code=(unsigned long)&_text;
	mman_struct.end_code=(unsigned long)&_etext;
	mman_struct.end_data=(unsigned long)&_edata;
	mman_struct.end_brk=(unsigned long)&_end;

	init_mem();
	
	init_interrupt();

	task_init();
	while(1);
}
