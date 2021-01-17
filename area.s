@returns area of rectangle
.data
h: .word 12
len: .word 10

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_h
   ldr r1,[r1]
   ldr r2,adr_len
   ldr r2,[r2]
   eor r3,r3,r3
   bl _main
   b _end

_main:
   mul r3,r1,r2
   bx lr

_end:
   mov r0,r3
   swi #11

adr_h: .word h
adr_len: .word len
