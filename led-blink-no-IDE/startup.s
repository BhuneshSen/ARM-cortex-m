.syntax unified     /* ins. for asmblr to use Unified Assembly Syntax for ARM*/
.cpu cortex-m4
.thumb

.global _start      /* Entry Point (rst hndlr) */
.extern main

.section .isr_vector
.word 0x20020000   /* Initial Stack Pointer */
.word _start       /* Reset Handler */

.section .text
.thumb_func
_start:
    bl main

loop:
    b loop
