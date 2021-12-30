#include "SMP.h"
#include "lib.h"
#include "printk.h"

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
    
}