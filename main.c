#include "printk.h"

void Start_Kernel(void)
{
	pos.Xresolution=1440;
	pos.Yresolution=900;
	pos.Xposition=pos.Yposition=0;
	pos.Xcharsize=8;
	pos.Ycharsize=16;
	pos.FB_addr=0xffff800000a00000;
	pos.FB_len=4096;

	printk(BLACK,WHITE,"hello \n%x\n",1231);
	int i=1/0;
	while(1);
}
