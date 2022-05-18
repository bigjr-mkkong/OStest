#include "serial.h"
#include "lib.h"

int init_serial(void){
    io_out8(PORT+1,0x00);    // Disable all interrupts
    io_out8(PORT+3,0x80);    // Enable DLAB (set baud rate divisor)
    io_out8(PORT+0,0x03);    // Set divisor to 3 (lo byte) 38400 baud
    io_out8(PORT+1,0x00);    //                  (hi byte)
    io_out8(PORT+3,0x03);    // 8 bits, no parity, one stop bit
    io_out8(PORT+2,0xC7);    // Enable FIFO, clear them, with 14-byte threshold
    io_out8(PORT+4,0x1E);    // Set in loopback mode, test the serial chip
    io_out8(PORT+0,0xAE);    // Test serial chip (send byte 0xAE and check if serial returns same byte)
    
    // Check if serial is faulty
    if(io_in8(PORT+0)!=0xAE){
        return 1;
    }
    
    // If serial is not faulty set it in normal operation mode
    // (not-loopback with IRQs enabled and OUT#1 and OUT#2 bits enabled)
    io_out8(PORT+4,0x0F);
    return 0;
}

int is_transmit_empty(){
   return io_in8(PORT+5)&0x20;
}
 
void write_serial(char a){
   while (!is_transmit_empty());
 
   io_out8(PORT,a);
}

int serial_received(){
   return io_in8(PORT+5)&1;
}
 
char read_serial(){
   while (!serial_received());
 
   return io_in8(PORT);
}