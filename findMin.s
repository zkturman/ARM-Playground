@find minimum
.data
nums: .word 1, 2, 3, 4, 5, 0, 5, 6, 7, 7
size: .word 10

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_nums
   ldr r2,adr_size
   ldr r2,[r2]
   ldr r8,[r1] @minimum
   eor r9,r9,r9 @iterator
   ldmfd sp!, {r4, r3, r2, r1}

_main:
   cmp r2,r9
   beq _end
   ldr r10,[r1],#4
   cmp r8,r10
   movgt r8,r10
   add r9,r9,#1
   b _main

_end:
   mov r0,r8
   swi #11

adr_nums: .word nums
adr_size: .word size
