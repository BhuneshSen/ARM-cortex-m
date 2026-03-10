.syntax unified
.cpu cortex-m4
.thumb

.global _start

.section .isr_vector
.word 0x20020000
.word _start

.section .text
_start:
    bl main
loop:
    b loop