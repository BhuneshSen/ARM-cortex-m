.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global _estack
.global Reset_Handler

/* External declaration for main */
.extern main

/* Stack pointer (defined in linker script) */
_estack = 0x20020000   /* Adjust based on RAM size */

/* Vector table */
.section .isr_vector, "a", %progbits
.type g_pfnVectors, %object

g_pfnVectors:
    .word _estack             /* Initial Stack Pointer */
    .word Reset_Handler       /* Reset Handler */
    .word Default_Handler     /* NMI */
    .word Default_Handler     /* HardFault */
    .word Default_Handler     /* MemManage */
    .word Default_Handler     /* BusFault */
    .word Default_Handler     /* UsageFault */
    .word 0                   /* Reserved */
    .word 0
    .word 0
    .word 0
    .word Default_Handler     /* SVCall */
    .word Default_Handler     /* Debug Monitor */
    .word 0                   /* Reserved */
    .word Default_Handler     /* PendSV */
    .word Default_Handler     /* SysTick */

    /* Add more IRQ handlers if needed */

.size g_pfnVectors, . - g_pfnVectors

/* Reset Handler */
.section .text.Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    /* Copy .data section from flash to RAM */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata

copy_data:
    cmp r1, r2
    ittt lt
    ldrlt r3, [r0], #4
    strlt r3, [r1], #4
    blt copy_data

    /* Zero initialize .bss */
    ldr r1, =_sbss
    ldr r2, =_ebss
    movs r3, #0

zero_bss:
    cmp r1, r2
    it lt
    strlt r3, [r1], #4
    blt zero_bss

    /* Call main */
    bl main

infinite_loop:
    b infinite_loop

.size Reset_Handler, . - Reset_Handler

/* Default Handler */
.section .text.Default_Handler
.type Default_Handler, %function

Default_Handler:
    b .

.size Default_Handler, . - Default_Handler