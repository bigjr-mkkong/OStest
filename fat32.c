#include "printk.h"
#include "fat32.h"
#include "disk.h"
#include "lib.h"

void DISK0_FAT32_FS_init(){
    unsigned char buf[512];
    struct Disk_Partition_Table DPT;
    struct FAT32_BootSector fat32_bootsector;
    struct FAT32_FSInfo fat32_fsinfo;

    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,0X0,1,(unsigned char*)buf);
    for(int i=0;i<512;i++){
        printk(RED,YELLOW,"%x ",buf[i]);
    }
}