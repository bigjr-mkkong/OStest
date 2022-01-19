#ifndef __TIMER_C__
#define __TIMER_C__

unsigned long volatile HPET_counter=0;//HPET_counter++ everytime when HPET_handler called

void timer_init();

#endif