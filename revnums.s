@reverse array of nums for array of size 4

.data
nums: .word 1, 2, 3, 4, 5, 6, 7, 8
size: .word 4
rev: .word 0, 0, 0, 0

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_nums
   ldr r2,adr_rev
   ldr r3,adr_size
   ldr r3,[r3] @size
   eor r5,r5,r5 @stack offset for later
   eor r6,r6,r6 @counter

_main:
   stmdb sp!,{r2}
   bl _loadnums
   mov r5,r3
   sub r5,#1
   lsl r5,r5,#2
   add sp,r5
   bl _reverse
   b _end

_loadnums:
   cmp r3,r6
   bxeq lr
   ldmia r1,{r7-r10}
   stmdb sp!,{r7-r10}
   add r6,r6,#4
   b _loadnums

_reverse:
   subs r6,r6,#1
   bxmi lr
   ldmda sp!,{r11}
   str r11,[r2],#4
   b _reverse

_end:
   swi #11

@literal pool
adr_nums: .word nums
adr_size: .word size
adr_rev: .word rev
