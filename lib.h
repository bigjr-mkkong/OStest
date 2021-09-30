#ifndef	__LIB_H__
#define __LIB_H__

#define NULL	0

#define sti() 		__asm__ __volatile__ ("sti	\n\t":::"memory")
#define cli()	 	__asm__ __volatile__ ("cli	\n\t":::"memory")
#define nop() 		__asm__ __volatile__ ("nop	\n\t")

void *(memset) (void *s,unsigned char c,long n);
void flush_tlb();
unsigned long* Get_gdt();
void io_out8(unsigned short port,unsigned char value);

typedef struct List{
	struct List *prev;
	struct List *next;
}List;


#endif