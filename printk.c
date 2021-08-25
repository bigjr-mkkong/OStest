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

char * dec2hex(char *str,int number){
	char ans[50],hex[16]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
	int remain,pt=0,pos=0,a[100];
	while(number>0){ 
		remain=number%16; 
		a[pos++]=remain; 
		number=number/16; 
	}
	for(pos=pos-1;pos>=0;pos--){
		*str++=hex[a[pos]];
	} 
	return str;
}

int vsprintf(char *fmt,va_list args){
	int transnum,pos=0;
	long int l_trans;
	char tmp,*str,*cpstr;
	for(str=buf;*fmt;fmt++){
		if(*fmt!='%'){
			*str=*fmt;
			str++;
			continue;
		}
		/* %x*/
		fmt++;
		if(*fmt=='d'){
			transnum=va_arg(args,int);
			do{
				*(str++)=transnum%10+'0';
				pos++;
				transnum/=10;
			}while(transnum);
			for(char *i=str;i>=str-(pos/2);i--){
				tmp=*i;
				*i=*(str-pos+(str-i)-1);
				*(str-pos+(str-i)-1)=tmp;
			}
		}else if(*fmt=='c'){
			*(str++)=(unsigned char)va_arg(args,int);
		}else if(*fmt=='s'){
			cpstr=va_arg(args,char *);
			if(*cpstr=='\0') continue;
			for(*str=*cpstr;*cpstr;str++,cpstr++){
				*str=(unsigned char)*cpstr;
			}
		}else if(*fmt=='x'){
			l_trans=va_arg(args,long);
			*str++='0';
			*str++='x';
			str=dec2hex(str,l_trans);
		}
	}
	return str-buf;
}

void printk(int FR_color,int BK_color,char *fmt,...){
	va_list args;
	va_start(args,fmt);
	int len=vsprintf(fmt,args);
	for(int i=0;i<len;i++){
		if((unsigned char)*(buf+i)=='\n'){
			pos.Yposition++;
			pos.Xposition = 0;
			continue;
		}
		else if((unsigned char)*(buf+i)=='\b'){
			pos.Xposition--;
			if(pos.Xposition<0){
				pos.Xposition=(pos.Xresolution/pos.Xcharsize-1)*pos.Xcharsize;
				pos.Yposition--;
				if(pos.Yposition<0){
					pos.Yposition=(pos.Yresolution/pos.Ycharsize-1)*pos.Ycharsize;
				}
			}	
			putchar(pos.FB_addr,pos.Xresolution,pos.Xposition*pos.Xcharsize,
			pos.Yposition*pos.Ycharsize,BLACK,WHITE,' ');	
		}
		putchar(pos.FB_addr,pos.Xresolution,pos.Xposition*pos.Xcharsize,
		pos.Yposition*pos.Ycharsize,FR_color,BK_color,*(buf+i));
		pos.Xposition++;
	}
}