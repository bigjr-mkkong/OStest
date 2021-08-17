#include "printk.h"
#include "font.h"
#include "lib.h"
#include <stdarg.h>

char buf[4086]={0};

void putchar(unsigned int *fb,int Xsize,int x,int y,unsigned int FRcolor,
	unsigned int BKcolor,unsigned char font){
	int i=0,j=0;
	unsigned int *addr=NULL;
	unsigned char *fontp=NULL;
	int mask=0;
	fontp=font_ascii[font];

	for(i=0;i<16;i++){
		addr=fb+Xsize*(y+i)+x;
		mask=0x100;
		for(j=0;j<8;j++){
			mask=mask>>1;
			if(*fontp&mask)
				*addr=FRcolor;
			else
				*addr=BKcolor;
			addr++;
		}
		fontp++;		
	}
}

int vsprintf(char *fmt,va_list args){
	int transnum,tmp=0;
	char *str;
	for(str=buf;*fmt;fmt++){
		if(*fmt!='%'){
			*str=*fmt;
			str++;
			continue;
		}
		/* %d %x %c %s*/
		fmt++;
		if(*fmt=='d'){
			transnum=va_arg(args,int);
			do{
				*(str++)=transnum%10+'0';
				tmp++;
				transnum/=10;
			}while(transnum);
			for(int j=0;j<tmp/2;j++){
        		str[j]=str[j]+str[tmp-1-j];
        		str[tmp-1-j]=str[j]-str[tmp-1-j];
       			str[j]=str[j]-str[tmp-1-j];
    		}
		}else if(*fmt=='c'){
			*(str++)=(unsigned char)va_arg(args,int);
		}else if(*fmt=='s'){

		}else{
			
		}
	}
	return str-buf;
}

void printk(int FR_color,int BK_color,char *fmt,...){
	va_list args;
	va_start(args,fmt);
	int len=vsprintf(fmt,args);
	for(int i=0;i<len;i++){
		putchar(pos.FB_addr,pos.Xresolution,pos.Xposition*pos.Xcharsize,
		pos.Yposition*pos.Ycharsize,BLACK,WHITE,*(buf+i));
		pos.Xposition++;
	}
}