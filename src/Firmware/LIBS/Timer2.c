/*
 * File:   Timer2.c
 * Author: Boaretti
 *
 * Created on November 2, 2016, 6:44 PM
 */


#include "xc.h"
#include "SPI_DAC8551.h"



void initTimer2()
{
    
    
    T2CON = 0;            // Clear Timer 1 configuration
    T2CONbits.TCKPS = 1;  // Set timer 1 prescaler (0=1:1, 1=1:8, 2=1:64, 3=1:256)
    PR2 = 0x153;          // Set Timer 1 period (max value is 65535)
    _T2IP = 2;            // Set Timer 1 interrupt priority
    _T2IF = 0;            // Clear Timer 1 interrupt flag
    _T2IE = 1;            // Enable Timer 1 interrupt
    T2CONbits.TON = 1; 
   
    T1CON = 0;            // Clear Timer 1 configuration
    T1CONbits.TCKPS = 3;  // Set timer 1 prescaler (0=1:1, 1=1:8, 2=1:64, 3=1:256)
    PR1 = 0x153;          // Set Timer 1 period (max value is 65535)
    _T1IP = 1;            // Set Timer 1 interrupt priority
    _T1IF = 0;            // Clear Timer 1 interrupt flag
    _T1IE = 1;            // Enable Timer 1 interrupt
    T1CONbits.TON = 1; 
   

  

}


