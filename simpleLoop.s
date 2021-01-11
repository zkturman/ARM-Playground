@increments from 1-10
.data
x: .word 1

.text
.global _start

_start:
   ldr r0, adr_x
   ldr r0, [r0]
   mov r1, #10
   b _loop

_loop:
   cmp r0, r1
   blt _increment
   b end

_increment:
   add r0, #1
   b _loop

_end:
   mov r7, #11
   swi #0
adr_x: .word x
