@is odd?
@sets r0 to 1 if odd and 2 if even

.data
num: .word 6

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_num
   ldr r1,[r1]
   bl _main
   b _end

_main:
   tst r1,#1
   moveq r0,#0
   movne r0,#1
   bx lr

_end:
   swi #11

adr_num: .word num
