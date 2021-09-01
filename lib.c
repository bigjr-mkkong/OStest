#include "lib.h"



void *(memset) (void *s,unsigned char c,long n){
    const unsigned char uc=c;
    unsigned char *su;
    for(su=s;0<n;++su,--n)
        *su=uc;
    return s;
}

unsigned long* Get_gdt(){
    unsigned long * tmp;
    __asm__ __volatile__ (
                    "movq %%cr3,%0\n\t"
                    :"=r"(tmp)
                    :
                    :"memory"
                    );
    return tmp;
}

void flush_tlb(){
    unsigned long tmpreg;\
    __asm__ __volatile__ (\
                "movq %%cr3,%0\n\t"\
                "movq %0,%%cr3\n\t"\
                :"=r"(tmpreg)\
                :\
                :"memory"\
                );
}

void io_out8(unsigned short port,unsigned char value){
    __asm__ __volatile__(   "outb   %0, %%dx    \n\t"
                "mfence         \n\t"
                :
                :"a"(value),"d"(port)
                :"memory");
}