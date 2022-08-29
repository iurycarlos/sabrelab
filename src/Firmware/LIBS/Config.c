
#include "GenericTypeDefs.h"
#include <xc.h>

void InitOsc() {
    //SETTING FRC+PLL TO 120000000 - THAT SUPPLY FCY=60MHZ
    // Initialize and configure Primary PLL, and enable Secondary Oscillator
    PLLFBD = 63; // M=65 //76    (ANYTHING HIGHER DOESN'T WORK)
    CLKDIVbits.PLLPRE = 0; // N1=2
    CLKDIVbits.PLLPOST = 0; // N2=2

    __builtin_write_OSCCONH(0x01); // set up to switch to FRC+PLL
    __builtin_write_OSCCONL(OSCCON | 0x01); // do the switch

    while (OSCCONbits.COSC != 0x00); // wait for switch to take place    
    while (OSCCONbits.LOCK != 1) {
    }; // wait for PLL lock
}

void InitPPS()
{
    // SETTING PPS 
    __builtin_write_OSCCONL(OSCCON & ~(1 << 6));

    //SETTING UART PINS
    RPINR18bits.U1RXR = 0x18; //PPS RX
    RPOR1bits.RP36R = 1; //PPS TX

    //SETTING SPI2 - SDCARD PINS
    RPINR22bits.SDI2R = 0x34; // RPI52 SDIO2
    RPOR3bits.RP40R = 0x08; //RP40 // SCDO2
    RPOR2bits.RP38R = 0x09; //RP38 // SCLK2

    __builtin_write_OSCCONL(OSCCON | (1 << 6));
    // END SETTING PPS
}