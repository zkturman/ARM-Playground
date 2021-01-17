@decimal coded binary
.data
num1: .word 0, 0, 0, 1, 2, 5
num2: .word 0, 0, 0, 9, 1, 2
sum: .word 0, 0, 0, 0, 0, 0
size: .word 6

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_num1
   ldr r2,adr_num2
   ldr r3,adr_sum
   ldr r4,adr_size
   ldr r4,[r4] @iterator
   eor r5,r5,r5 @carry
   eor r8,r8,r8 @digit1
   eor r9,r9,r9 @digit2
   eor r10,r10,r10 @sumdigit
   mov r11,sp
   bl _main
   b _end

_main:
   push {r11}
   add r11,sp,#0
   sub sp,sp,#12
   subs r4,#1
   add sp,r11,#0
   popmi {r11}
   bxmi lr
   ldr r8,[r1, r4, lsl #2]
   ldr r9,[r2, r4, lsl #2]
   add r10,r8,r9
   add r10,r10,r5
   eor r5,r5,r5
   cmp r10,#10
   addge r5,#1
   subge r10,#10
   str r10,[r3, r4, lsl #2]
   b _main


_end:
   swi #11

adr_num1: .word num1
adr_num2: .word num2
adr_sum: .word sum
adr_size: .word size
