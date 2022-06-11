#include "printk.h"
#include "fat32.h"
#include "disk.h"
#include "lib.h"
#include "memory.h"
#include "VFS.h"

struct Disk_Partition_Table DPT;
struct FAT32_BootSector fat32_bootsector;
struct FAT32_FSInfo fat32_fsinfo;

unsigned long FirstDataSector=0;    //First sector number of data sector
unsigned long BytesPerClus=0;
unsigned long FirstFAT1Sector=0;
unsigned long FirstFAT2Sector=0;

void FAT32_write_superblock(struct super_block *sb){

}

void FAT32_put_superblock(struct super_block *sb){

}

void FAT32_write_inode(struct index_node *inode){

}

struct super_block_operations FAT32_sb_ops={
    .write_superblock=&FAT32_write_superblock,
    .put_superblock=&FAT32_put_superblock,
    .write_inode=&FAT32_write_inode,
};

long FAT32_compare(struct dir_entry *parent_dentry, char *src_filename, char *dst_filename){

}

long FAT32_release(struct dir_entry *dentry){

}

long FAT32_iput(struct dir_entry *dentry, struct index_node *inode){

}

struct dir_entry_operations FAT32_dentry_ops={
    .compare=&FAT32_compare,
    .release=&FAT32_release,
    .iput=&FAT32_iput,
};

long FAT32_create(struct index_node *inode, struct dir_entry *dentry, long mode){

}

struct dir_entry *FAT32_lookup(struct index_node *parent_node, struct dir_entry *dentry){

}

long FAt32_mkdir(struct index_node *inode, struct dir_entry *dentry, long mode){

}

long FAT32_rmdir(struct index_node *inode, struct dir_entry *dentry){

}

long FAT32_rename(struct index_node *old_inode, struct dir_entry *old_dentry, \
    struct index_node *new_inode, struct dir_entry *new_dentry){

}

long FAT32_getattr(struct dir_entry *dentry, unsigned long *attr){

}

long FAT32_setattr(struct dir_entry *dentry, unsigned long *attr){

}

struct index_nodes_operations FAT32_inode_ops={
    .create=&FAT32_create,
    .lookup=&FAT32_lookup,
    .mkdir=&FAt32_mkdir,
    .rmdir=&FAT32_rmdir,
    .rename=&FAT32_rename,
    .getattr=FAT32_getattr,
    .setattr=FAT32_setattr,
};

unsigned int DISK0_FAT32_read_FAT_Entry(unsigned int fat_entry){
    unsigned int buf[128];
    memset(buf,0,512);

    IDE_device_operation.transfer(ATA_READ_CMD,FirstFAT1Sector+(fat_entry>>7),1,(unsigned char*)buf);
    return buf[fat_entry&0x7f];
}
unsigned int DISK0_FAT32_write_FAT_Entry(unsigned int fat_entry, unsigned int value){
    unsigned int buf[128];
    memset(buf,0,512);

    IDE_device_operation.transfer(ATA_READ_CMD,FirstFAT1Sector+(fat_entry>>7),1,(unsigned char*)buf);
    buf[fat_entry & 0x7f]=(buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
    //update both FAT1 and FAT2
	IDE_device_operation.transfer(ATA_WRITE_CMD,FirstFAT1Sector+(fat_entry>>7),1,(unsigned char*)buf);
	IDE_device_operation.transfer(ATA_WRITE_CMD,FirstFAT2Sector+(fat_entry>>7),1,(unsigned char*)buf);
	return 1;
}
/*
lookup(): search directory entry in given directory
*/
struct FAT32_Directory *lookup(char *name, int namelen, struct FAT32_Directory *dentry, int flags){
    unsigned int cluster=0;
    unsigned long sector=0;
    unsigned char *buf=NULL;

    unsigned int j=0;

    struct FAT32_Directory *tmpdentry=NULL,*p=NULL;
    struct FAT32_LongDirectory *tmpldentry=NULL;

    buf=kmalloc(BytesPerClus,0);
    cluster=(dentry->DIR_FirstClus_HIGH<<16)|(dentry->DIR_FirstClus_LOW);

next_cluster:
    //read parent cluster sector
    sector=FirstDataSector+(cluster-2)*fat32_bootsector.BPB_SecPerClus;
    if(!IDE_device_operation.transfer(ATA_READ_CMD,sector,fat32_bootsector.BPB_SecPerClus,(unsigned char *)buf)){
        printk(RED,YELLOW,"[FS]: lookup() failed to read disk\n");
        kfree(buf);
        return NULL;
    }
    tmpdentry=(struct FAT32_Directory*)buf;
    //search in directory entry
    for(int i=0;i<BytesPerClus;i+=32,tmpdentry++){
        if(tmpdentry->DIR_Attr==ATTR_LONGNAME){
            continue;
        }
        if(tmpdentry->DIR_Name[0]==0xe5||tmpdentry->DIR_Name[0]==0x00||tmpdentry->DIR_Name==0x05){
            continue;
        }
        tmpldentry=(struct FAT32_LongDirectory*)tmpdentry-1;
        j=0;
        //long directory entry search
        while(tmpldentry->LDIR_Attr==ATTR_LONGNAME && tmpldentry->LDIR_Ord!=0xe5){
            for(int x=0;x<5;x++){
                if(j>namelen&&tmpldentry->LDIR_Name1[x]==0xffff){
                    continue;
                }else if(j>namelen||tmpldentry->LDIR_Name1[x]!=(unsigned short*)(name[j++])){
                    goto continue_cmp_fail;
                }
            }

            for(int x=0;x<6;x++){
                if(j>namelen&&tmpldentry->LDIR_Name2[x]==0xffff){
                    continue;
                }else if(j>namelen||tmpldentry->LDIR_Name2[x]!=(unsigned short*)(name[j++])){
                    goto continue_cmp_fail;
                }
            }

            for(int x=0;x<2;x++){
                if(j>namelen&&tmpldentry->LDIR_Name3[x]==0xffff){
                    continue;
                }else if(j>namelen||tmpldentry->LDIR_Name3[x]!=(unsigned short*)(name[j++])){
                    goto continue_cmp_fail;
                }
            }

            if(j>=namelen){
                p=(struct FAT32_Directory*)kmalloc(sizeof(struct FAT32_Directory),0);
                *p=*tmpdentry;

                kfree(buf);
                return p;
            }
            tmpldentry--;
        }

        //short directory entry search
        j=0;
        for(int x=0;x<8;x++){
            switch(tmpdentry->DIR_Name[x]){
                case ' ':
                    if(!(tmpdentry->DIR_Attr&ATTR_DIRECTORY)){
                        if(name[j]=='.'){
                            continue;
                        }else if(tmpdentry->DIR_Name[x]==name[j]){
                            j++;
                            break;
                        }else{
                            goto continue_cmp_fail;
                        }
                    }else{
                        if(j<namelen&&tmpdentry->DIR_Name[x]==name[j]){
                            j++;
                            break;
                        }else if(j==namelen){
                            continue;
                        }else{
                            goto continue_cmp_fail;
                        }
                    }
                case 'A' ... 'Z':
                case 'a' ... 'z':
                case '0' ... '9':
                    if(j<namelen && tmpdentry->DIR_Name[x]==name[j]){
                        j++;
                        break;
                    }else{
                        goto continue_cmp_fail;
                    }
                
                default:
                    j++;
                    break;
            }
        }
        //file extension compare
        if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY)){
			j++;
			for(int x=8;x<11;x++){
				switch(tmpdentry->DIR_Name[x]){
					case 'A' ... 'Z':
					case 'a' ... 'z':
                    case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == name[j]){
						    j++;
						    break;
						}else{
						    goto continue_cmp_fail;
                        }
					case ' ':
						if(tmpdentry->DIR_Name[x] == name[j]){
							j++;
							break;
						}else{
							goto continue_cmp_fail;
                        }
					default :
						goto continue_cmp_fail;
				}
			}
		}
		p=(struct FAT32_Directory *)kmalloc(sizeof(struct FAT32_Directory),0);
		*p=*tmpdentry;
		kfree(buf);
		return p;
        
        continue_cmp_fail:;//goto next entry
    }

    //read LBA of next cluster from FAT table
    cluster=DISK0_FAT32_read_FAT_Entry(cluster);
	if(cluster < 0x0ffffff7)
		goto next_cluster;

	kfree(buf);
	return NULL;
}

/*
FS path walk
name is the path for certain file
*/
struct FAT32_Directory *path_walk(char *name, unsigned long flags){
    char *tmpname=NULL;
    int tmpnamelen=0;
    struct FAT32_Directory *parent=NULL;
    struct FAT32_Directory *path=NULL;
    char *dentryname=NULL;

    while(*name=='/'){
        name++;
    }

    if(!(*name)){
        return NULL;
    }

    parent=(struct FAT32_Directory *)kmalloc(sizeof(struct FAT32_Directory),0);
    dentryname=kmalloc(PAGE_4K_SIZE,0);
    memset(parent,0,sizeof(struct FAT32_Directory));
    memset(dentryname,0,PAGE_4K_SIZE);

    /*
    set the root directory start clus as the beginning clus number of fat32
    just 4 convenience
    */ 
    parent->DIR_FirstClus_LOW=fat32_bootsector.BPB_RootClus&0xffff;
    parent->DIR_FirstClus_HIGH=(fat32_bootsector.BPB_RootClus>>16)&0xffff;

    while(1){
        tmpname=name;
        while(*name && (*name!='/')){
            name++;
        }
        tmpnamelen=name-tmpname;
        memcpy(tmpname,dentryname,tmpnamelen);
        dentryname[tmpnamelen]='\0';

        /*
        dentryname contain next level's dir/file name which is wait to search
        parent contains the current directory which is wait to be search
                parent.DIR_Name
                    /     \
                   /       \
              dentryname   ...
        */
        path=lookup(dentryname,tmpnamelen,parent,flags);

        //unable to find dentryname in parent
        if(path==NULL){
            printk(RED,YELLOW,"Cannot find file or dir: %s\n",dentryname);
            kfree(dentryname);
            kfree(parent);
            return NULL;
        }

        /*
        cases when search end: if the target is not a directory
        example: name="/xxx/yyy"
        */
        if(!(*name)){
            if(flags & ATTR_HIDDEN){
                kfree(dentryname);
                kfree(path);
                return parent;
            }
            kfree(dentryname);
            kfree(parent);
            return path;
        }
        
        //filte out following '/'
        while(*name=='/'){
            name++;
        }

        /*
        cases when search end: if is a directory
        example: name="/xxx/yyy/"
        */
        if(!(*name)){
            if(flags & ATTR_HIDDEN){
                kfree(dentryname);
                kfree(path);
                return parent;
            }
            kfree(dentryname);
            kfree(parent);
            return path;
        }

        *parent=*path;
        kfree(path);//better to use kfree() instead memset() 2 prevent memory leak
    }
}

/*
    TODO: define vfs operations (superblock, inode, file)
    and assign some empty functions inside 

*/

struct super_block *fat32_read_superblock(struct Disk_Partition_Table_Entry *DPTE, void *buf){
    struct super_block *sbp=NULL;
    struct FAT32_inode_info *finode=NULL;
    struct FAT32_BootSector *fbs=NULL;
    struct FAT32_sb_info *fsbi=NULL;

    sbp=(struct super_block *)kmalloc(sizeof(struct super_block),0);
    memset(sbp,0,sizeof(struct super_block));

    sbp->sb_ops=&FAT32_sb_ops;
    sbp->private_sb_info=(struct FAT32_sb_info *)kmalloc(sizeof(struct FAT32_sb_info),0);

    //fat32 bootsector
    fbs=(struct FAT32_BootSector*)buf;
    fsbi=sbp->private_sb_info;
    fsbi->start_sector=DPTE->start_LBA;
    fsbi->sector_count=DPTE->sectors_limit;
    fsbi->sector_per_clus=fbs->BPB_SecPerClus;
    fsbi->bytes_per_sector=fbs->BPB_BytesPerSec;
    fsbi->bytes_per_clus=fbs->BPB_BytesPerSec*fbs->BPB_SecPerClus;
    fsbi->Data_firstsector=DPTE->start_LBA+fbs->BPB_RsvdSecCnt+fbs->BPB_FATSz32*fbs->BPB_NumFATs;

    fsbi->FAT1_firstsector=DPTE->start_LBA+fbs->BPB_RsvdSecCnt;
    fsbi->sector_per_FAT=fbs->BPB_FATSz32;
    fsbi->NumFATs=fbs->BPB_NumFATs;
    fsbi->fsinfo_sector_in_fat=fbs->BPB_FSInfo;
    fsbi->bootsector_bk_in_fat=fbs->BPB_BkBootSec;

    //fat32 fsinfo sector
    fsbi->fat_fsinfo=(struct FAT32_FSInfo*)kmalloc(sizeof(struct FAT32_FSInfo),0);
    memset(fsbi->fat_fsinfo,0,sizeof(struct FAT32_FSInfo));
    IDE_device_operation.transfer(ATA_READ_CMD,DPTE->start_LBA+fbs->BPB_FSInfo,1,(unsigned char*)fsbi->fat_fsinfo);

    //directory rntry
    sbp->root=(struct dir_entry*)kmalloc(sizeof(struct dir_entry),0);
    memset(sbp->root,0,sizeof(struct dir_entry));

    list_init(&sbp->root->child_node);
    list_init(&sbp->root->subdirs_list);
    sbp->root->parent=sbp->root;
    sbp->root->dir_ops=&FAT32_dentry_ops;
    sbp->root->name=(char*)kmalloc(2,0);
    sbp->root->name[0]='/';
    sbp->root->name_length=1;

    //index node
    sbp->root->dir_inode=(struct index_node*)kmalloc(sizeof(struct index_node),0);
    memset(sbp->root->dir_inode,0,sizeof(struct index_node));
    sbp->root->dir_inode->inode_ops=&FAT32_inode_ops;
    sbp->root->dir_inode->file_size=0;
    sbp->root->dir_inode->blocks=(sbp->root->dir_inode->file_size+fsbi->bytes_per_clus-1)/fsbi->bytes_per_sector;

    sbp->root->dir_inode->attributes=FS_ATTR_DIR;
    sbp->root->dir_inode->sb=sbp;

    //fat32 root inode
    sbp->root->dir_inode->private_index_info=(struct FAT32_inode_info*)kmalloc(sizeof(struct FAT32_inode_info),0);
    memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
    finode=(struct FAT32_inode_info*)sbp->root->dir_inode->private_index_info;
    finode->first_cluster=fbs->BPB_RootClus;
    finode->dentry_location=0;
    finode->dentry_position=0;
    finode->create_date=0;
    finode->create_time=0;
    finode->write_date=0;
    finode->write_time=0;
    return sbp;
}

struct file_system_type FAT32_fs_type={
    .name="FAT32",
    .fs_flags=0,
    .read_superblock=fat32_read_superblock,
    .next=NULL,
};



void DISK0_FAT32_FS_init(){
    unsigned char buf[512];

    struct FAT32_Directory *dentry=NULL;

    /*
    Read Disk Partition Table
    */
    printk(RED,YELLOW,"Primary Partition Table:\n");
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,0x00,1,(unsigned char*)buf);
    DPT=*(struct Disk_Partition_Table*)buf;
    printk(RED,YELLOW,"Start: %x End: %x ID: %x Sectors: %x\n",\
        DPT.DPTE[0].start_LBA,\
        DPT.DPTE[0].sectors_limit+DPT.DPTE[0].start_LBA-1,\
        DPT.DPTE[0].type,\
        DPT.DPTE[0].sectors_limit);

    /*
    Read FAT32 Boot Sector
    */
    printk(RED,YELLOW,"FAT32 Boot Sector:\n");
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,\
        DPT.DPTE[0].start_LBA,\
        1,\
        (unsigned char*)buf);
    fat32_bootsector=*(struct FAT32_BootSector*)buf;
    printk(RED,YELLOW,"OEMName: %s\nSecNum for FSInfo: %x\nTotal SectorNum: %x\n",\
    fat32_bootsector.BS_OEMName,\
    fat32_bootsector.BPB_FSInfo,\
    fat32_bootsector.BPB_TotSec32);

    /*
    Read FSInfo Sector
    */
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,\
        DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_FSInfo,\
        1,\
        (unsigned char*)buf);
    fat32_fsinfo=*(struct FAT32_FSInfo*)buf;
    printk(RED,YELLOW,"FSI LeadSig: %x\n",fat32_fsinfo.FSI_LeadSig);

    /*
    Initialize FS Data
    */
    FirstDataSector=DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_RsvdSecCnt+ \
        fat32_bootsector.BPB_FATSz32*fat32_bootsector.BPB_NumFATs;
    FirstFAT1Sector=DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_RsvdSecCnt;
    FirstFAT2Sector=FirstFAT1Sector+fat32_bootsector.BPB_FATSz32;
    BytesPerClus=fat32_bootsector.BPB_SecPerClus*fat32_bootsector.BPB_BytesPerSec;

    dentry=path_walk("/abcd",0);

    if(dentry!=NULL){
        printk(RED,YELLOW,"File /abcd Found, File Size: %x\n",dentry->DIR_FileSize);
    }else{
        printk(RED,YELLOW,"File Not Found\n");
    }

    dentry=path_walk("/testdir/longfilenametest.txt",0);

    if(dentry!=NULL){
        printk(RED,YELLOW,"File /testdir/longfilenametest.txt Found, File Size: %x\n",dentry->DIR_FileSize);
    }else{
        printk(RED,YELLOW,"File Not Found\n");
    }

    dentry=path_walk("/do_not_exist",0);

    if(dentry!=NULL){
        printk(RED,YELLOW,"File /do_not_exist Found, File Size: %x\n",dentry->DIR_FileSize);
    }else{
        printk(RED,YELLOW,"File Not Found\n");
    }
}