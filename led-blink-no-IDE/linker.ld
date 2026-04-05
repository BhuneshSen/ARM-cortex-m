ENTRY(_start)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K
}

SECTIONS
{
  .text :
  {
    *(.isr_vector)
    *(.text*)
    *(.rodata*)
  } > FLASH
}
