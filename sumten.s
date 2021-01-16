.section .text
.align 2
.global _start

_start:
   eor r0,r0,r0
   eor r0,r0,r0
   eor r2,r2,r2

_loop:
   add r2,r2,#1
   add r0,r0,r2
   cmp r2,#10 @check if done
   beq _done
   b _loop

_done:
   mov r7,#1
   swi #0
