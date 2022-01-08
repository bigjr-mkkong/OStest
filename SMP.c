#include "SMP.h"
#include "lib.h"
#include "printk.h"

extern unsigned char APU_boot_start[];
extern unsigned char APU_boot_end[];
void SMP_init(){
    unsigned int a,b,c,d;
    for(int i=0;;i++){
        get_cpuid(0xb,i,&a,&b,&c,&d);
        if((c>>8&0xff)==0) break;
        
        if((c>>8&0xff)==1){
            printk(WHITE,BLACK,"Type: SMT ID  ");
        }else if((c>>8&0xff)==2){
            printk(WHITE,BLACK,"Type: Core ID ");
        }
        printk(WHITE,BLACK,"Width: %x number of logical processor: %x\n",a&0x1f,b&0xff);
    }
    printk(WHITE,BLACK,"SMP(): copy bytes: %x",(unsigned long)&APU_boot_end-(unsigned long)&APU_boot_start);
    memcpy(APU_boot_start,\
    (unsigned char*)0xffff800000020000,\
    (unsigned long)&APU_boot_end-(unsigned long)&APU_boot_start);
}