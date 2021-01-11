.data
array:
   .skip 10
x:
   .word 0

.text
.global _start

_start:
   mov r0, #10 @loop end value
   mov r1, #0 @array memory offset
   ldr r2, adr_array
   ldr r3, adr_x
   ldr r3, [r3] @start value for incrementing
   bl _populateLoop
   mov r1, #0
   mov r3, #0
   bl _verifyLoop
   b _end

_populateLoop:
   add r3, r3, #1 @increment starting value
   str r3, [r2, r1]
   add r1, r1, #4 @increase array offset
   cmp r3, r0
   bxeq lr
   b _populateLoop

_verifyLoop: @verify array population works as expected
   ldr r4, [r2, r1]
   add r1, r1, #4
   add r3, r3, #1
   cmp r3, r0
   blt _verifyLoop
   bx lr

_end:
   mov r7, #11
   swi #0

adr_x: .word x
adr_array: .word array
