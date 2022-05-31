#include "VFS.h"

struct file_system_type filesystem = {"filesystem",0};

struct super_block *mount_fs(char *name, struct Disk_Partition_Table_Entry *DPTE, void *buf){
    struct file_system_type *p=NULL;
    for(p=&filesystem;p;p=p->next){
        if(!strcmp(name,p->name)){
            return p->read_superblock(DPTE,buf);
        }
    }
    return 0;
}

unsigned long umount_fs(struct file_system_type *fs){
    struct file_system_type *p=NULL;
    for(p=&filesystem;p;p=p->next){
        if(!strcmp(fs->name,p->name)){
            return 0;
        }
    }
    fs->next=filesystem.next;
    filesystem.next=fs;
    return 1;
}