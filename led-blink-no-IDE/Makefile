CC=arm-none-eabi-gcc
CFLAGS=-mcpu=cortex-m4 -mthumb -nostdlib

all:
	$(CC) $(CFLAGS) startup.s main.c -T linker.ld -o main.elf
	arm-none-eabi-objcopy -O binary main.elf main.bin