#ifndef __MOUSE_H__
#define __MOUSE_H__

extern struct keyboard_input_buf *p_mouse;

#define KBCMD_SENDTO_MOUSE  0xd4
#define MOUSE_ENABLE        0xf4

#define KBCMD_EN_MOUSE_INTFACE 0xa8

//3 byte mouse data packet
struct mouse_packet{
    unsigned char byte0;
    char byte1,byte2;
};

struct mouse_packet mouse;


void mouse_init();
void mouse_exit();

void analysis_mousecode();
#endif