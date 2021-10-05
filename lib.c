#include "lib.h"

void *(memset) (void *s,unsigned char c,long n){
    const unsigned char uc=c;
    unsigned char *su;
    for(su=s;0<n;++su,--n)
        *su=uc;
    return s;
}

void * memcpy (const void *src, void *dest, long len){
  char *d = dest;
  const char *s = src;
  while (len--)
    *d++ = *s++;
  return dest;
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
    __asm__ __volatile__(   
                "outb %0,%%dx    \n\t"
                "mfence         \n\t"
                :
                :"a"(value),"d"(port)
                :"memory");
}

unsigned char io_in8(unsigned short port){
    unsigned char ret = 0;
    __asm__ __volatile__(   
                "inb %%dx,%0  \n\t"
                "mfence     \n\t"
                :"=a"(ret)
                :"d"(port)
                :"memory");
    return ret;
}

void list_init(List *list){
    list->prev=list;
    list->next=list;
    return;
}

void list_add_to_behind(List *entry, List *newnode){
    newnode->next=entry->next;
    newnode->prev=entry;
    newnode->next->prev=newnode;
    entry->next=newnode;
    return;
}

void list_add_to_before(List *entry,List *newnode){
    newnode->next=entry;
    entry->prev->next=newnode;
    newnode->prev=entry->prev;
    entry->prev=newnode;
    return;
}

void list_del(List *entry){
    entry->prev->next=entry->next;
    entry->next->prev=entry->prev;
    return;
}

int list_is_empty(List *entry){
    if(entry->prev==entry&&entry->next==entry){
        return 1;
    }
    return 0;
}

List *list_next(List *entry){
    if(entry->next!=NULL) return entry->next;
    return NULL;
}