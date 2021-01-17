@returns area of a circle, pi apprx 22/7
.data
rad: .word 3

.section .text
.align 2
.global _start

_start:
   ldr r1,adr_rad
   ldr r1,[r1]
   mov r2,#22 @numerator for pi approx
   eor r3,r3,r3 @area
   mov r11,sp
   bl _main
   b _end



_main:
   push {r11,lr}
   add r11,sp,#0
   sub sp,sp,#16
   add r4,r1,#0
   mul r1,r4,r1
   bl _approxPi
   sub sp,r11,#0
   pop {r11,pc}

_approxPi:
   push {r11}
   add r11,sp,#0
   sub sp,sp,#12
   mul r2,r1,r2
loop:
   sub r2,#7
   cmp r2,#7
   addgt r3,#1
   sub sp,r11,#0
   poplt {r11}
   bxlt lr
   b loop

_end:
   mov r0,r3
   swi #11

adr_rad: .word rad
