#ifndef __VFS_H__
#define __VFS_H__

#include "lib.h"

#define FS_ATTR_FILE	(1UL << 0)
#define FS_ATTR_DIR 	(1UL << 1)

struct super_block_operations{
    void (*write_superblock)(struct super_block *sb);
    void (*put_superblock)(struct super_block *sb);
    void (*write_inode)(struct index_node *inode);
};

struct index_nodes_operations{
    long (*create)(struct index_node *inode, struct dir_entry *dentry, int mode);
    struct dir_entry (*lookup)(struct index_node *parent_node, struct dir_entry *dest_dentry);
    long (*mkdir)(struct index_node *inode, struct dir_entry *dentry, int mode);
    long (*rmdir)(struct index_node *inode, struct dir_entry *dentry);
    long (*rename)(struct index_node *old_inode, struct dir_entry *old_dentry, struct index_node *new_inode, struct dir_entry *new_dentry);
    long (*getattr)(struct dir_entry *dentry, unsigned long *attr);
    long (*setattr)(struct dir_entry *dentry, unsigned long *attr);
};

struct dir_entry_operations{
    long (*compare)(struct dir_entry *parent_dentry, char *src_filename, char *dst_filename);
    long (*release)(struct dir_entry *dentry);
    long (*iput)(struct dir_entry *dentry, struct index_node *inode);
};

struct file_operations{
    long (*open)(struct index_node *inode, struct file *filp);
    long (*close)(struct index_node *inode, struct file *filp);
    long (*read)(struct file *filp, char *buf, unsigned long count, long *position);
    long (*write)(struct file *filp, char *buf, unsigned long count, long *position);
    long (*lseek)(struct file *filp, long offset, long origin);
    long (*ioctl)(struct index_node *inode, struct file *filp, unsigned long cmd, unsigned long arg);
};

struct super_block{
    struct dir_entry *root;
    struct super_block_operations *sb_ops;
    void *private_sb_info;
};
struct index_node{
    unsigned long file_size;
    unsigned long blocks;
    unsigned long attributes;

    struct super_block *sb;
    struct file_operations *f_ops;
    struct index_nodes_operations *inode_ops;
    void *private_index_info;
};
struct dir_entry{
    char *name;
    int name_length;
    struct List child_node;
    struct List subdirs_list;
    
    struct index_node *dir_inode;
    struct dir_entry *parent;
    struct dir_entry_operations *dir_ops;
};

struct file{
    long position;
    unsigned long mode;
    struct dir_entry *dentry;
    struct file_operations *f_ops;
    void *private_info;
};

struct file_system_type{
    char *name;
    int fs_flags;
    struct super_block *(*read_superblock)(struct Disk_Partition_Table_Entry *DPTE, void *buf);
    struct file_system_type *next;
};

unsigned long umount_fs(struct file_system_type *fs);
#endif