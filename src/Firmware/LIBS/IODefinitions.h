/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  


#include <xc.h> // include processor files - each processor file is guarded.  

/*OUTPUT PINS - LED SIGNALS*/

#define LED1 LATAbits.LATA2
#define TRIS_LED1 TRISAbits.TRISA2

#define LED2 LATAbits.LATA3
#define TRIS_LED2 TRISAbits.TRISA3

#define LED3 LATAbits.LATA10
#define TRIS_LED3 TRISAbits.TRISA10

/*INPUT PINS - SWITCHS*/

/*SWITCH 1*/
#define SW1 PORTCbits.RC0
#define TRIS_SW1 TRISCbits.TRISC0

/*SWITCH 2*/
#define SW2 PORTCbits.RC1
#define TRIS_SW2 TRISCbits.TRISC1

/*SWITCH 3*/
#define SW3 PORTCbits.RC2
#define TRIS_SW3 TRISCbits.TRISC2


void SetupIO();