@changes all the characters in a string to uppercase

.data
string: .asciz "here is the eXample!!"

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_string
   mov r2,#'a'
   sub r2,r2,#'A' @difference
   eor r3,r3,r3 @current char
   bl _main
   b _end

_main:
   ldrb r3,[r1]
   cmp r3,#0
   bxeq lr
   cmp r3,#'a'
   addlt r1,r1,#1
   blt _main
   cmp r3,#'z'
   addgt r1,r1,#1
   bgt _main
   sub r3,r3,r2
   strb r3,[r1],#1
   b _main

_end:
   swi #11

adr_string: .word string
