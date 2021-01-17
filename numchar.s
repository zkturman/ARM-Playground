@counts the number of a given char in a string
.data
string: .asciz "this is a stringaaaaaa"
char: .word 'a'

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_string
   ldr r2,adr_char
   ldr r2,[r2]
   eor r5,r5,r5 @iterator
   eor r6,r6,r6 @current character
   eor r7,r7,r7 @charcount
   bl _search
   b _end

_search:
   ldrb r6,[r1],#1
   cmp r6,#0
   bxeq lr
   cmp r6,r2
   addeq r7,r7,#1
   b _search

_end:
   mov r0,r7
   swi #11

adr_string: .word string
adr_char: .word char
