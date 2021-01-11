CC1=arm-none-eabi-as
CC2=arm-none-eabi-ld
QEMU=qemu-arm
LDLIBS=-lm


armTest: object=armTest
armTest: armTest.s
	$(CC1) -g $(object).s -o $(object).o
	$(CC2) $(object).o -o $(object).arm
	$(QEMU) -singlestep -g 1999 $(object).arm &
	gdb-multiarch

simpleLoop: object=simpleLoop
simpleLoop: simpleLoop.s
	$(CC1) -g $(object).s -o $(object).o
	$(CC2) $(object).o -o $(object).arm
	$(QEMU) -singlestep -g 1999 $(object).arm &
	gdb-multiarch

arrayLoop: object=arrayLoop
arrayLoop: arrayLoop.s
	$(CC1) -g $(object).s -o $(object).o
	$(CC2) $(object).o -o $(object).arm
	$(QEMU) -singlestep -g 1999 $(object).arm &
	gdb-multiarch
