#ifndef __SERIAL_H__
#define __SERIAL_H__

#define PORT    0x3f8
int init_serial(void);
void write_serial(char a);
char read_serial();

#endif