run:
	nasm boot.asm -o boot.bin
	nasm loader.asm -o loader.bin
	nasm kernel.asm -o kernel.bin
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -t msdos -o loop a.img /mnt/floppy/
	sudo cp -fv loader.bin /mnt/floppy/
	sudo cp -fv kernel.bin /mnt/floppy/
	sudo umount /mnt/floppy/
	bochs -f bochsrc

clean:
	rm *.bin *.txt