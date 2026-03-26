CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-gcc

CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -O0
LDFLAGS = -T linker.ld -nostdlib

all: main.elf

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

startup.o: startup_stm32f411re.s
	$(AS) -mcpu=cortex-m4 -mthumb startup_stm32f411re.s -o startup.o

main.elf: main.o startup.o
	$(LD) $(CFLAGS) main.o startup.o $(LDFLAGS) -o main.elf

clean:
	rm -f *.o *.elf