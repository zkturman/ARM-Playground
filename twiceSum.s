@twiceSum
.data
num1: .word 4
num2: .word 2


.section .text
.align 2
.global _start

_start:
ldr r1,adr_num1
ldr r1,[r1]
ldr r2,adr_num2
ldr r2,[r2]
adds r6,r1,r2
lslne r6,r6,#1

_end:
mov r0,r6
mov r7,#1
swi #0

adr_num1: .word num1
adr_num2: .word num2
