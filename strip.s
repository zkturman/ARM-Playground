@removes a certain character from a string

.data
string: .asciz "remove all the eeeeeees"
stripped: .byte 50

.section .text
.align 2
.global _start

_start:
   ldr r0,adr_stripped
   ldr r1,adr_string
   eor r2,r2,r2 @current char
   bl _main
   b _end

_main:
   ldrb r2,[r1],#1
   cmp r2,#'e'
   strneb r2,[r0],#1
   cmp r2,#0
   bxeq lr
   b _main

_end:
   swi #11

adr_string: .word string
adr_stripped: .word stripped
