#ifndef	__LIB_H__
#define __LIB_H__

#define NULL	0

#define container_of(ptr,type,member)\
({\
	typeof(((type *)0)->member) *p = (ptr);\
	(type *)((unsigned long)p-(unsigned long)&(((type *)0)->member));\
})

#define sti() 		__asm__ __volatile__ ("sti	\n\t":::"memory")
#define cli()	 	__asm__ __volatile__ ("cli	\n\t":::"memory")
#define nop() 		__asm__ __volatile__ ("nop	\n\t")
#define io_mfence() __asm__ __volatile__ ("mfence	\n\t":::"memory")

#define port_insw(port,buffer,nr)	\
__asm__ __volatile__("cld;rep;insw;mfence;"::"d"(port),"D"(buffer),"c"(nr):"memory")

#define port_outsw(port,buffer,nr)	\
__asm__ __volatile__("cld;rep;outsw;mfence;"::"d"(port),"S"(buffer),"c"(nr):"memory")

void *(memset) (void *s,unsigned char c,long n);
void * memcpy (const void *src, void *dest, long len);
void flush_tlb();
unsigned long* Get_gdt();
void io_out8(unsigned short port,unsigned char value);
void wrmsr(unsigned long address,unsigned long value);

typedef struct List{
	struct List *prev;
	struct List *next;
}List;


#endif