@determines the length of a string
.data
string: .asciz "hello;lkajsdflkjasdf"

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_str
   eor r5,r5,r5 @counter
   eor r6,r6,r6 @current char

_main:
   ldrb r6,[r1],#1
   cmp r6,#0
   beq _end
   add r5,r5,#1
   b _main

_end:
   swi #11

adr_str: .word string
