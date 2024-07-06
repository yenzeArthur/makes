#ifndef __AVR_ATmega32__
    #define __AVR_ATmega32__
#endif

#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

// #define MASK 0b00100000

int main(void){

    DDRB |= (1<<DDB5);

    while(1){
        PORTB |= (1<<PB5);
        _delay_ms(1000);
        PORTB &= ~(1<<PB5);
        _delay_ms(1000);
    }

}