#include "keyboard.h"
#include "lib.h"
#include "interrupt.h"
#include "APIC.h"
#include "memory.h"
#include "printk.h"

struct keyboard_input_buf *p_kb=NULL;
static int shift_l,shift_r,ctrl_l,ctrl_r,alt_l,alt_r;

void keyboard_handler(unsigned long nr,unsigned long parameter,struct pt_regs *regs){
    unsigned char x;
    x=io_in8(0x60);

    if(p_kb->p_head==p_kb->buf+KB_BUF_SIZE){
        p_kb->p_head=p_kb->buf;
    }
    
    *p_kb->p_head=x;
    p_kb->count++;
    p_kb->p_head++;
}

hw_int_controller keyboard_int_controller={
    .enable=IOAPIC_enable,
    .disable=IOAPIC_disable,
    .install=IOAPIC_install,
    .uninstall=IOAPIC_uninstall,
    .ack=IOAPIC_edge_ack,
};

unsigned char get_scancode(){
    unsigned char ret=0;
    if(p_kb->count==0){
        while(!p_kb->count){
            nop();
        }
    }

    if(p_kb->p_tail==p_kb->buf+KB_BUF_SIZE){
        p_kb->p_tail=p_kb->buf;
    }

    ret=*p_kb->p_tail;
    p_kb->count--;
    p_kb->p_tail++;

    return ret;

}

void analysis_keycode(){
    unsigned char x=0;//scan code
    int key=0;//key printed on the screen
    int make=0;//determine whether scan code is up/down(1 is down, 0 is up)

    x=get_scancode();

    if(x==0xe1){//pause break
        key=PAUSEBREAK;
        for(int i=1;i<6;i++){
            if(get_scancode()!=pausebreak_scode[i]){
                key=0;
                break;
            }
        }
    }else if(x==0xe0){//print screen
        x=get_scancode();

        switch(x){
            case 0x2a://printscreen down
                if(get_scancode()==0xe0){
                    if(get_scancode()==0x37){
                        key=PRINTSCREEN;
                        make=1;
                    }
                }
                break;
            
            case 0xb7://printscreen up
                if(get_scancode()==0xe0){
                    if(get_scancode()==0xaa){
                        key=PRINTSCREEN;
                        make=1;
                    }
                }
                break;
            
            case 0x1d://right ctrl down
                ctrl_r=1;
                key=OTHERKEY;
                break;
            
            case 0x9d://right ctrl up
                ctrl_r=0;
                key=OTHERKEY;
                break;

            case 0x38://right alt down
                alt_r=1;
                key=OTHERKEY;
                break;

            case 0xb8://right alt up
                alt_r=0;
                key=OTHERKEY;
                break;
            
            default:
                key=OTHERKEY;
                break;
        }
    }
    if(key==0){
        unsigned int *keyrow=NULL;
        int column=0;

        make=(x&FLAG_BREAK?0:1);

        keyrow=&keycode_map_normal[(x&0x7f)*MAP_COLS];

        if(shift_l||shift_r){
            column=1;
        }

        key=keyrow[column];

        switch(x&0x7f){
            case 0x2a://Left shift
                shift_l=make;
                key=0;
                break;

            case 0x36://Right shift
                shift_r=make;
                key=0;
                break;

            case 0x1d://left ctrl
                ctrl_l=make;
                key=0;
                break;
            
            case 0x38://left alt
                alt_l=make;
                key=0;
                break;

            default:
                if(!make){
                    key=0;
                }
                break;
        }
        if(key) printk(RED,BLACK,"Scancode: %x(K: %c)\n",x,key);
    }
}

void keyboard_init(){
    struct IO_APIC_RET_entry entry;
    p_kb=(struct keyboard_input_buf *)kmalloc(sizeof(struct keyboard_input_buf),0);
//p_kb=0xffff800000600000
    p_kb->p_head=p_kb->buf;
    p_kb->p_tail=p_kb->buf;
    p_kb->count=0;
    memset(p_kb->buf,0,KB_BUF_SIZE);

    entry.vector=0x21;
    entry.deliver_mode=APIC_ICR_IOAPIC_Fixed;
    entry.dest_mode=ICR_IOAPIC_DELV_PHYSICAL;
    entry.deliver_status=APIC_ICR_IOAPIC_Idle;
    entry.polarity=APIC_IOAPIC_POLARITY_HIGH;
    entry.irr=APIC_IOAPIC_IRR_RESET;
    entry.trigger=APIC_ICR_IOAPIC_Edge;
    entry.mask=APIC_ICR_IOAPIC_Masked;
    entry.reserved=0;

    entry.destination.physical.reserved1=0;
    entry.destination.physical.phy_dest=0;
    entry.destination.physical.reserved2=0;

    wait_KB_write();
    io_out8(PORT_KB_CMD,KBCMD_WRITE_CMD);
    wait_KB_read();
    io_out8(PORT_KB_DATA,KB_INIT_MODE);

    for(int i=0;i<1000;i++){
        for(int j=0;j<1000;j++){
            nop();
        }
    }

    shift_l=shift_r=ctrl_l=ctrl_r=alt_l=alt_r=0;

    register_irq(0x21,&entry ,&keyboard_handler,\
    (unsigned long)p_kb,&keyboard_int_controller,"ps/2 keyboard");
}

void keyboard_exit(){
    unregister_irq(0x21);
    kfree((unsigned long *)p_kb);
    return;
}