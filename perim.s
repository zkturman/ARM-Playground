@returns the perimeter of a rectangle
.data
height: .word 5
length: .word 7

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_height
   ldr r1,[r1]
   ldr r2,adr_length
   ldr r2,[r2]
   eor r3,r3,r3 @perimeter
   bl _main
   b _end

_main:
   lsl r1,#1
   lsl r2,#1
   add r3,r1,r2
   bx lr

_end:
   mov r0,r3
   swi #11

adr_height: .word height
adr_length: .word length
