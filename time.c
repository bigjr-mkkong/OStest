#include "time.h"
#include "lib.h"

char CMOS_READ(char addr){
    io_out8(0x70,0x80|addr);
    return io_in8(0x71);
}

void get_cmos_time(struct time *t){
    cli();
    do{
        t->year=CMOS_READ(0x09)+CMOS_READ(0x32)*0x100;
        t->month=CMOS_READ(0x08);
        t->day=CMOS_READ(0x07);
        t->hour=CMOS_READ(0x04);
        t->min=CMOS_READ(0x02);
        t->sec=CMOS_READ(0x00);
    }while(t->sec!=CMOS_READ(0x0));
    io_out8(0x70,0x0);
    sti();
}