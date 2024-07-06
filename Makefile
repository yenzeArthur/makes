builds = build
cpu    = atmega328p
file   = blink.c
port   = COM16

compiler = C:\Users\aRTHUr\AppData\Local\Arduino15\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino7\bin\avr-gcc
obj_copy = C:\Users\aRTHUr\AppData\Local\Arduino15\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino7\bin\avr-objcopy
avrdude  = C:\Users\aRTHUr\AppData\Local\Arduino15\packages\arduino\tools\avrdude\6.3.0-arduino17\bin\avrdude
avrconf  = C:\Users\aRTHUr\AppData\Local\Arduino15\packages\arduino\tools\avrdude\6.3.0-arduino17\etc\avrdude.conf

c_flags = -mmcu=$(cpu) -Os -Wall
linker  = -w -Os -Wl,--gc-sections

all: compile upload clean

compile:
	$(compiler) $(c_flags) -c $(file) -o $(builds)\blink.o
	$(compiler) $(c_flags) $(builds)\blink.o -o $(builds)\blink.elf
	$(obj_copy) -O ihex $(builds)\blink.elf $(builds)\blink.hex 

upload:
	$(avrdude) -C$(avrconf) -v -p$(cpu) -carduino -P$(port) -b115200 -D -Uflash:w:$(builds)\blink.hex:i

clean:
	del /Q $(builds)\blink.o
	del /Q $(builds)\blink.elf
	del /Q $(builds)\blink.hex