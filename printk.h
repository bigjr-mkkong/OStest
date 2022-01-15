#ifndef __PRINTK_H__
#define __PRINTK_H__

#include "spinlock.h"

#define WHITE 	0x00ffffff
#define BLACK 	0x00000000
#define RED		0x00ff0000
#define ORANGE	0x00ff8000
#define YELLOW	0x00ffff00
#define GREEN	0x0000ff00
#define BLUE	0x000000ff
#define INDIGO	0x0000ffff
#define PURPLE	0x008000ff

struct screen{
	int Xresolution;
	int Yresolution;

	int Xposition;
	int Yposition;

	int Xcharsize;
	int Ycharsize;

	int *FB_addr;
	int FB_len;

	spinlock_T printk_lock;
}pos;

//char buf[4096]={0};

void printk(int FR_color,int BK_color,char *fmt,...);

#endif