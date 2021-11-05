#include "printk.h"
#include "gate.h"
#include "trap.h"
#include "lib.h"
#include "memory.h"
#include "interrupt.h"
#include "task.h"
#include "cpu.h"

struct Global_Memory_Descriptor mman_struct;
/*
mman_struct is a global memory control unit
*/
extern char _text;
extern char _etext;
extern char _edata;
extern char _end;

void Start_Kernel(void){
	//setting screen infomatoin
	pos.Xresolution=1440;
	pos.Yresolution=900;
	pos.Xposition=pos.Yposition=0;
	pos.Xcharsize=8;
	pos.Ycharsize=16;
	pos.FB_addr=(int *)0xffff800003000000;
	pos.FB_len=(pos.Xresolution*pos.Yresolution*4+PAGE_4K_SIZE-1)&(PAGE_4K_MASK);
	//load TR with selector defined in GDT
	load_TR(10);

	set_tss64(0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00,0xffff800000007c00, 
	0xffff800000007c00,0xffff800000007c00,0xffff800000007c00);

	set_sys_int();
	
	init_cpu();

	mman_struct.start_code=(unsigned long)&_text;
	mman_struct.end_code=(unsigned long)&_etext;
	mman_struct.end_data=(unsigned long)&_edata;
	mman_struct.end_brk=(unsigned long)&_end;

	init_mem();

	//printk(BLACK,WHITE,"\ntest test\n");//0c1047c0  call rdx ;rdx=0xffff8000_00108e5d
	init_interrupt();
	
	slab_init();
	void *tmp=NULL;
	printk(RED,YELLOW,"Color map BEFORE kmalloc(): %d\n",\
		*kmalloc_cache_size[10].cache_pool->color_map);

	tmp=kmalloc(kmalloc_cache_size[10].size,0);

	printk(RED,YELLOW,"Color map AFTER kmalloc(): %d\n",\
		*kmalloc_cache_size[10].cache_pool->color_map);

	kfree(tmp);

	printk(RED,YELLOW,"Color map AFTER kfree(): %d",\
		*kmalloc_cache_size[10].cache_pool->color_map);

	//task_init();
	while(1);
}
