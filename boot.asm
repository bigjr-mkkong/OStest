org 07c00h
	jmp LABEL_BEGIN
	nop

BaseOfStack		equ		07c00h
BaseOfLoader	equ		0x1000
OffsetOfLoader	equ		0x00

%include "include/fat12.inc"

LABEL_BEGIN:
	mov ax,cs
	mov ds,ax
	mov es,ax
	mov ss,ax
	mov sp,07c00h

	mov ax,3h ; clear screen
	int 10h

	mov	ax,	0200h ;reset pointer
	mov	bx,	0000h
	mov	dx,	0000h
	int	10h

	xor ah,ah ;refresh disk driver
	xor dl,dl
	int 13h

	mov ax,StartBootingMsg
	mov cx,BootingMsgLen
	call DispStr

	mov word [SecLoadStart],SectorNumOfRootDirStart ;0x7c68
LABEL_START_LOADING_SECTOR:
	cmp word [RootDirSectorForLoop],0
	jz LABEL_NO_LOADER
	dec word [RootDirSectorForLoop]

	mov	ax,00h
	mov	es,ax
	mov	bx,8000h
	mov	ax,[SecLoadStart]
	mov	cl,1
	call ReadSector ;es:bx = start addr of loaded sector
	mov	si,NameOfLoader
	mov	di,8000h
	cld
	mov dx,10h

LABEL_SEARCH_FOR_LOADER:
	cmp dx,0
	jz LABEL_SEARCH_NEXT_SECTOR
	dec dx
	mov cx,11
LABEL_COMPARING_NAME:
	cmp cx,0
	jz LABEL_FILENAME_FOUND
	dec cx
	lodsb
	cmp al,byte [es:di]
	jz LABEL_CONTINUE
	jmp LABEL_DIFFERENT_NAME
LABEL_CONTINUE:
	inc di
	jmp LABEL_COMPARING_NAME
LABEL_DIFFERENT_NAME:
	and	di,0ffe0h
	add	di,20h
	mov si,NameOfLoader
	jmp LABEL_SEARCH_FOR_LOADER

LABEL_SEARCH_NEXT_SECTOR:
	add word [SecLoadStart],1
	jmp LABEL_START_LOADING_SECTOR

LABEL_NO_LOADER:
	mov ax,MissLoaderMsg
	mov cx,MissLoaderMsglen
	call DispStr

	jmp	$

LABEL_FILENAME_FOUND:
	mov ax,RootDirSectors
	and di,0ffe0h
	add di,01ah
	mov cx,word [es:di]
	push cx
	add cx,ax
	add cx,SectorBalance ;cx: first sector of the loader
	mov ax,BaseOfLoader
	mov es,ax
	mov bx,OffsetOfLoader
	mov ax,cx

LABEL_CONTINUE_LOADING:
	mov cl,1
	call ReadSector
	pop ax	;ax: offset of fat entry in fat12 table
	call GetFATEntry
	cmp ax,0fffh
	jz LABEL_FILE_LOADED
	push ax
	mov dx,RootDirSectors
	add ax,dx
	add ax,SectorBalance
	add bx,[BPB_BytesPerSec]
	jmp LABEL_CONTINUE_LOADING

LABEL_FILE_LOADED:
	jmp BaseOfLoader:OffsetOfLoader

	

SecLoadStart			dw		0
RootDirSectorForLoop	dw		RootDirSectors
Odd		db	0

NameOfLoader	db	"LOADER  BIN",0

StartBootingMsg	db	"Booting..."
BootingMsgLen	equ	$ - StartBootingMsg

TestMsg			db	0dh,0ah,"Here"
TestMsgLen		equ	$ - TestMsg

MissLoaderMsg	db	0dh,0ah,"Loader Not Found"
MissLoaderMsglen	equ		$ - MissLoaderMsg

DispStr:  ;AX-> MessageBaseAddr CX->MessageLength
	mov bp,ax
	mov	ax,1301h
	mov	bx,000fh
	mov dl,0
	int 10h
	ret

Debug:
	mov ax,TestMsg
	mov cx,TestMsgLen
	call DispStr
	ret

ReadSector:
; ax: reading start sector number
; cl: number of sector going to read
; [es:bx]: buffer of sectors in mem

;ans1=sector_number/sec_per_trk
;start sector=remainder-1
;cylinder=ans1>>1
;head=ans1&1

	push	bp
	mov	bp,	sp
	sub	esp,	2
	mov	byte	[bp - 2],	cl
	push	bx
	mov	bl,	[BPB_SecPerTrk]
	div	bl
	inc	ah
	mov	cl,	ah
	mov	dh,	al
	shr	al,	1
	mov	ch,	al
	and	dh,	1
	pop	bx
	mov	dl,	[BS_DrvNum]
.Go_On_Reading:
	mov	ah,	2
	mov	al,	byte	[bp - 2]
	int	13h
	jc	.Go_On_Reading
	add	esp,	2
	pop	bp
	ret

GetFATEntry:

	push es
	push bx
	push ax
	mov	ax,00
	mov	es,ax
	pop	ax
	mov	byte [Odd],0
	mov	bx,3
	mul	bx
	mov	bx,2
	div	bx
	cmp	dx,0
	jz	.Label_Even
	mov	byte [Odd],1; ax is odd number

.Label_Even:
	xor	dx,dx
	mov	bx,[BPB_BytesPerSec]
	div	bx; ax: consult, the offset of sector which have fatentry base on fat table
		  ; dx:remainder, the offset of fatentry base on the sector which contains fatentry 
	push dx
	mov	bx,8000h
	add	ax,SectorNumOfFAT1Start; ax: sector number which has fatentry
	mov	cl,2
	call ReadSector
	
	pop	dx
	add	bx,dx;bx: offset of fat entry
	mov	ax,[es:bx]
	cmp	byte [Odd],1
	jnz	.Label_Even_2
	shr	ax,4

.Label_Even_2:
	and	ax,0fffh
	pop	bx
	pop	es
	ret

times (510-($-$$)) db 0
dw 0xaa55