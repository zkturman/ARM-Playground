@takes the average of an array of numbers
.data
nums: .word 1, 2, 3, 4, 5
size: .word 5

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_nums
   ldr r2,adr_size
   ldr r2,[r2] @array size
   eor r5,r5,r5 @sum
   eor r6,r6,r6 @iterator
   eor r7,r7,r7 @current num
   eor r8,r8,r8 @average
   eor r9,r9,r9 @average
   bl _sum
   bl _div
   b _end

_sum:
   cmp r6,r2
   bxeq lr
   ldr r7,[r1],#4
   add r5,r5,r7
   add r6,r6,#1
   b _sum

_div:
   cmp r2,r5
   bxgt lr
   sub r5,r5,r2
   add r8,r8,#1
   b _div

_end:
   swi #11

adr_nums: .word nums
adr_size: .word size
