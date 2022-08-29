/*
 * File:   SPI_DAC8551.c
 * Author: Boaretti
 *
 * Created on November 3, 2016, 9:54 AM
 */
 

#include "xc.h"
#include "../LIBS/SPI_DAC8551.h"
#include "HardwareProfile.h"
#include "GenericTypeDefs.h"

//-------------------------------------------------------------------------
// DEFINITION OF CS PIN FOR THE SPI-DAC8551
 //------------------------------------------------------------------------
#define CS LATBbits.LATB0
#define TRIS_CS TRISBbits.TRISB0

/**
 * Configure the Serial Peripheral Interface (SPI) module of the PIC to act as
 * a slave.
 *
 * @return void
 */
void SPI1Init(void) {
    TRIS_CS = 0;
    //-------------------------------------------------------------------------
    //  1. Clear the SPI Buffer register
    //-------------------------------------------------------------------------
    SPI1BUF = 0; // Clear the SPI buffer.

    //-------------------------------------------------------------------------
    //  2. Initial configuration for the interface interrupts.
    //-------------------------------------------------------------------------
    IFS0bits.SPI1IF = 0; // Clear the interrupt flag
    IEC0bits.SPI1IE = 0; // Disable interrupt (for now)

    //-------------------------------------------------------------------------
    //  3. Configure SPI1CON1 register.
    //-------------------------------------------------------------------------
    SPI1CON1bits.DISSCK = 0; // Internal Serial Clock is enabled.
    SPI1CON1bits.DISSDO = 0; // SDO1 pin is controlled by the module
    SPI1CON1bits.MODE16 = 0; // Communication is byte-wide (8-bits)
    SPI1CON1bits.SMP = 0; // Input data is sampled at the middle of
    // data output time.
    SPI1CON1bits.CKE = 1; // Serial output data changes on transition
    // from active clock state to idle clock
    // state.
    SPI1CON1bits.SSEN = 0; // Slave Select 1 (SS1-bar) is used for
    // slave mode.
    SPI1CON1bits.CKP = 0; // Active high clock.
    SPI1CON1bits.MSTEN = 1; // Master mode disabled.

    SPI1CON1bits.PPRE = 3; // clk / 4
    SPI1CON1bits.SPRE = 7; // Sec. 1:1

    SPI1STATbits.SPIEN = 1; // Enable SPI module

    //-------------------------------------------------------------------------
    //  Final configuration for the interface interrupts.
    //-------------------------------------------------------------------------

    IFS0bits.SPI1IF = 0; // Clear the interrupt flag.
    IEC0bits.SPI1IE = 0; // Disable interrupt.

}


/**
 * Write the Audio Sample to the SPI-DAC8551
 * Parameters: low byte, high byte samples
 *
 * Internally transform unsigned to signed
 * 
 * @return void
 */
void WriteDAC(int Slo, int Shi) 
{
    UINT16 Sound;

    // Transform unsigned to signed;
    Sound = (Slo + (Shi << 8)); // -32.767 ........0.........+32.768
    Sound = ((Sound + 0x7FFF)); //16 bits 0..........32.767...........65.53

    CS = 0;
    WriteSPI1(0x00); // CONFIGS
    WriteSPI1(Sound >> 8); //UPPER BYTE
    WriteSPI1(Sound); // LOWER BYTE
    CS = 1;
    
    return;
} 

// send one byte of data and receive one back at the same time

int WriteDACMix(int Slo, int Shi) 
{
    UINT16 Sound;
    float FSound;
    float Mixed;
    UINT16 OSound;
    FSound = (float) Sound;

    Sound = (Slo + (Shi << 8)); // -32.767 ........0.........+32.767
    FSound = (float) Sound;
    FSound = FSound/32768.0f;
    Mixed = FSound + 0;
    OSound = (UINT16) (Mixed*32768.0f);
    //if (Sound == 0x8000)
   //     Sound = 0x0000;
  //  else
        OSound = ((OSound + 0x7FFF)); //16 bits 0..........32.767...........65.535
    CS = 0;
    WriteSPI1(0x00); // CONFIGS
    WriteSPI1(OSound >> 8); //UPPER BYTE
    WriteSPI1(OSound); // LOWER BYTE
    CS = 1;
    // read the received value
    return;
} 
int WriteSPI1(int data) 
{
    SPI1BUF = data; // write to buffer for TX
    while (!SPI1STATbits.SPIRBF); // wait transfer completion
    return SPI1BUF; // read the received value
} // WriteSPI2

