CC=arm-none-eabi-gcc
CFLAGS=-mcpu=cortex-m4 -mthumb -nostdlib

all:
	$(CC) $(CFLAGS) startup.s main.c -T linker.ld -o main.elf
	arm-none-eabi-objcopy -O binary main.elf main.bin

clean:
	rm -f main.elf main.bin

#flash:
#	D:\files\temp\ARM\stlink-1.8.0-win32\stlink-1.8.0-win32\bin\st-flash.exe write main.bin 0x08000000
