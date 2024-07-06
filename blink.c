#ifndef __AVR_ATmega32__
    #define __AVR_ATmega32__
#endif

#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(void){

    DDRD |= (1<<DD7);

    while(1){
        PORTD |= (1<<PD7);
        _delay_ms(500);
        PORTD &= ~(1<<PD7);
        _delay_ms(1000);

    }
}