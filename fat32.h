#ifndef __FAT32_H__
#define __FAT32_H__

struct Disk_Partition_Table_Entry{
    unsigned char flag;						//boot indicator
    unsigned char start_head;
    unsigned short  start_sector    :6,
                    start_cylinder  :10;
    unsigned char type;						//system id
    unsigned char end_head;
    unsigned short  end_sector      :6,
                    end_cylinder    :10;
    unsigned int start_LBA;					//relative sector
    unsigned int sectors_limit;				//total sector
}__attribute__((packed));

struct Disk_Partition_Table{
    unsigned char BS_Reserved[446];
    struct Disk_Partition_Table_Entry DPTE[4];
    unsigned short BS_TrailSig;
}__attribute__((packed));

struct FAT32_BootSector{
	unsigned char BS_jmpBoot[3];		//JMP+NOP ins
	unsigned char BS_OEMName[8];		//OEM name
	unsigned short BPB_BytesPerSec;		//Bytes Per Sector
	unsigned char BPB_SecPerClus;		//Sector Per Clus
	unsigned short BPB_RsvdSecCnt;		//Reserved Sector Count
	unsigned char BPB_NumFATs;			//Nuber of FAT
	unsigned short BPB_RootEntCnt;		//Maximun Root Dir Entries
	unsigned short BPB_TotSec16;		//Number of Sectors Smaller than 32MB
	unsigned char BPB_Media;			//Medis Discriptor
	unsigned short BPB_FATSz16;			//Sector Per FAT
	unsigned short BPB_SecPerTrk;		//Sector Per Track
	unsigned short BPB_NumHeads;		//Number of Head
	unsigned int BPB_HiddSec;			//Number of Hidden Section In Partition
	unsigned int BPB_TotSec32;			//Number of Sectors In Partition
	
	unsigned int BPB_FATSz32;			//Number of Sector Per FAT
	unsigned short BPB_ExtFlags;		//FLAGS
	unsigned short BPB_FSVer;			//Version of FAT driver
	unsigned int BPB_RootClus;			//Cluster Number of the Start of the Root Directory
	unsigned short BPB_FSInfo;			//Sector Number of the FS Info Sector
	unsigned short BPB_BkBootSec;		//Sector Number of the Backup Boot Sector
	unsigned char BPB_Reserved[12];		//Reserved

	unsigned char BS_DrvNum;			//Logical Driver Number of Partition
	unsigned char BS_Reserved1;			//Unused
	unsigned char BS_BootSig;			//Extended Signature
	unsigned int BS_VolID;				//Serial Number of Partition
	unsigned char BS_VolLab[11];		//Volume Name of Partition
	unsigned char BS_FilSysType[8];		//FAT Name

	unsigned char BootCode[420];

	unsigned short BS_TrailSig;			//55AA
}__attribute__((packed));

struct FAT32_FSInfo{
    unsigned int FSI_LeadSig;
    unsigned char FSI_Reserved[480];
    unsigned int FSI_StructSig;
    unsigned int FSI_Free_Count;
    unsigned int FSI_Nxt_Free;
    unsigned char FSI_Reserved2[12];
    unsigned int FSI_TrailSig;
}__attribute__((packed));

#define ATTR_READ_ONLY	(1<<0)
#define ATTR_HIDDEN		(1<<1)
#define ATTR_SYSTEM 	(1<<2)
#define ATTR_VOLUME_ID	(1<<3)
#define ATTR_DIRECTORY	(1<<4)
#define ATTR_ARCHIVE	(1<<5)
#define ATTR_LONGNAME	(ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM | ATTR_VOLUME_ID)

struct FAT32_Directory{
	unsigned char DIR_Name[11];			//Basic Directory Name
	unsigned char DIR_Attr;				//Directory Attribute
	unsigned char DIR_NTres;			//Reserved
	unsigned char DIR_CrtTimeTenth;		//File create ms timestamp
	unsigned short DIR_CrtTime;			//File create timestamp
	unsigned short DIR_CrtDate;			//File create date
	unsigned short DIR_LastAccDate;		//Last date 2 access
	unsigned short DIR_FirstClus_HIGH;	//Start Clus (HIGH)
	unsigned short DIR_WriteTime;		//Last time 2 write
	unsigned short DIR_WriteDate;		//Last date 2 write
	unsigned short DIR_FirstClus_LOW;	//Start Clus (LOW)
	unsigned int DIR_FileSize;			//Directory File Size
}__attribute__((packed));

#define LOWERCASE_BASE 	(8)
#define LOWERCASE_EXT	(16)

struct FAT32_LongDirectory{
	unsigned char LDIR_Ord;				//Order 4 long directory
	unsigned short LDIR_Name1[5];		//First 1-5 char of name
	unsigned char LDIR_Attr;			//Directory Attribute (has to be ATTR_LONGNAME)
	unsigned char LDIR_Type;			//(if (== LDIR_Type 0) is-the-sub-entry-4-long-directory)
	unsigned char LDIR_Chksum;			//chksum=((chksum&1)?0x80:0)+(checksum>>1)+DIR_Name[N]
	unsigned short LDIR_Name2[6];		//Middle 6-11 char of name
	unsigned short LDIR_FirstClus_LOW;	//has to be 0
	unsigned short LDIR_Name3[2];		//Last 12-13 char of name
}__attribute__((packed));

struct FAT32_sb_info{
	unsigned long start_sector;
	unsigned long sector_count;

	long sector_per_clus;
	long bytes_per_clus;
	long bytes_per_sector;

	unsigned long Data_firstsector;
	unsigned long FAT1_firstsector;
	unsigned long sector_per_FAT;
	unsigned long NumFATs;

	unsigned long fsinfo_sector_in_fat;
	unsigned long bootsector_bk_in_fat;

	struct FAT32_FSInfo *fat_fsinfo;
};

struct FAT32_inode_info{
	unsigned long first_cluster;
	unsigned long dentry_location;

	unsigned long dentry_position;
	unsigned short create_date;
	unsigned short create_time;
	unsigned short write_date;
	unsigned short write_time;
};




void DISK0_FAT32_FS_init();

#endif