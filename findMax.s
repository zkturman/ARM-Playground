@find max
.data
nums: .word 3, 2, 3, 4, 5, 6, 7, 1, 9, 1, 3
size: .word 11

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_nums @load address for array
   ldr r2,adr_size @size of array
   ldr r2,[r2]
   eor r6,r6,r6 @offset
   eor r7,r7,r7 @maximum
   eor r9,r9,r9 @iterator

_main:
   cmp r2,r9
   beq _end
   ldrb r8,[r1],#4
   cmp r7,r8
   movlt r7,r8
   add r9,r9,#1
   b _main

_end:
   mov r0,r7
   swi #11

adr_nums: .word nums
adr_size: .word size
