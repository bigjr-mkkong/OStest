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

	/*putchar(pos.FB_addr,pos.Xresolution,pos.Xposition*pos.Xcharsize,
		pos.Yposition*pos.Ycharsize,BLACK,WHITE,'K');*/
	printk(BLACK,WHITE,"hello \n%x",1231);
	while(1);
}
