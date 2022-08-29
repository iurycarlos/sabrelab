#include "BitConfig.h"
#include <stdio.h>
#include <math.h>
#include <p24EP256MC204.h>
#include "FSIO.h"
#include "CONU2.h"
#include "../LIBS/SPI_DAC8551.h"
#include "../LIBS/Timer2.h"
#include "../LIBS/Config.h"
#include "../LIBS/WavManager.h"
#include "../LIBS/IODefinitions.h"


#define BufferSize 128
#define WavBufferSize 256 

#define Empty 0
#define Ready 1

#define Stopping 2
#define Rolling 1
#define Waiting 0

#define Silence 0
#define Won 1
#define Hit 2
#define Swing 3
#define On 4
#define Off 5

int EventSound = Silence;
int StreamStatus = Waiting;

UINT8 receiveBuffer[100];
char txtBuffer[100];



int WavBuffer1State = 0;
int WavBuffer2State = 0;

long ReadAmountBuffer1 = 0;
long ReadAmountBuffer2 = 0;

int PBuffer = 0;

long WavBufferPos = 0;

FSFILE * OnFile;
FSFILE * OffFile;
FSFILE * WonFile;
FSFILE * HitFile;
FSFILE * SwgFile;



// audio stuff (WAV file)
UINT8 bitsPerSample;
UINT32 sampleRate;
UINT8 numberOfChannels;
UINT32 dataSize;
UINT8 blockAlign;

UINT8 audioStream[WavBufferSize];
UINT8 WavBuffer1[WavBufferSize];
UINT8 WavBuffer2[WavBufferSize];

UINT16 retBytes;
long ADCValues[3] = {0, 0, 0};
long AntADCValues[3] = {0, 0, 0};
long DifADCValues[3] = {0, 0, 0};
int a = 0;
long Euclides = 0;

void initPWM()
{


    /* Set PWM Periods on PHASEx Registers */
    TRISBbits.TRISB10 = 0; /* Set as a digital output */
    TRISBbits.TRISB11 = 0; /* Set as a digital output */
    TRISBbits.TRISB12 = 0; /* Set as a digital output */
    TRISBbits.TRISB13 = 0; /* Set as a digital output */
    TRISBbits.TRISB14 = 0; /* Set as a digital output */
    TRISBbits.TRISB15 = 0; /* Set as a digital output */

    LATBbits.LATB10 = 0; /* Set as a digital output */
    LATBbits.LATB11 = 0; /* Set as a digital output */
    LATBbits.LATB12 = 0; /* Set as a digital output */
    LATBbits.LATB13 = 0; /* Set as a digital output */
    LATBbits.LATB14 = 0; /* Set as a digital output */
    LATBbits.LATB15 = 0; /* Set as a digital output */

    PORTBbits.RB10 = 0;
    PORTBbits.RB11 = 0;
    PORTBbits.RB12 = 0;
    PORTBbits.RB13 = 0;
    PORTBbits.RB14 = 0;
    PORTBbits.RB15 = 0;

    /* Set PWM Periods on PHASEx Registers */
    PHASE1 = 1000;
    PHASE2 = 1000;
    PHASE3 = 1000;
    /* Set Duty Cycles */
    PDC1 = 0;
    PDC2 = 0;
    PDC3 = 0;
    /* Set Dead Time Values */
    /* DTRx Registers are ignored in this mode */
    DTR1 = DTR2 = DTR3 = 0;
    ALTDTR1 = ALTDTR2 = ALTDTR3 = 25;
    /* Set PWM Mode to Complementary */
    IOCON1 = IOCON2 = IOCON3 = 0xC000;
    /* Set Independent Time Bases, Center-Aligned mode and
     Independent Duty Cycles */
    PWMCON1 = PWMCON2 = PWMCON3 = 0x0204;
    /* Configure Faults */
    FCLCON1 = FCLCON2 = FCLCON3 = 0x0003;
    /* 1:1 Prescaler */
    PTCON2 = 0x0004;
    /* Enable PWM Module */
    PTCON = 0x8000;
    
    
}

void InitADC10bits()
{
    //SETTING PINS LIKE INPUT //
    TRISAbits.TRISA0 = 1;
    TRISAbits.TRISA1 = 1;
    TRISBbits.TRISB1 = 1;

    TRISCbits.TRISC1 = 1;

    ANSELAbits.ANSA0 = 1; // Ensure AN0/RA0 is analog
    ANSELAbits.ANSA1 = 1; // Ensure AN1/RA1 is analog
    ANSELBbits.ANSB1 = 1; // Ensure AN3/RB1 is analog

    ANSELCbits.ANSC1 = 0; // no 
    /* Initialize and enable ADC module */
    AD1CON1 = 0x000C; // Enable simultaneous sampling and auto-sample //ASAM=1 SIAM=1
    AD1CON2 = 0x0300; // Sample 4 channels
    AD1CON3 = 0x000F;
    AD1CON4 = 0x0000;

    AD1CSSH = 0x0000;
    AD1CSSL = 0x0000;



    AD1CHS0bits.CH0SA = 3; // Select AN5 for CH0 +ve input
    AD1CHS0bits.CH0NA = 0; // Select Vref- for CH0 -ve input
    AD1CHS123bits.CH123SA = 0; // Select AN0 for CH1 +ve input
    // Select AN1 for CH2 +ve input
    // Select AN2 for CH3 +ve input
    AD1CHS123bits.CH123NA = 0; // Select Vref- for CH1/CH2/CH3 -ve inputs
    AD1CON1bits.ADON = 1;


}

void InitADC()
{
    //SETTING PINS LIKE INPUT //
    TRISAbits.TRISA0 = 1;
    TRISAbits.TRISA1 = 1;
    TRISBbits.TRISB1 = 1;

    TRISCbits.TRISC1 = 1;

    ANSELAbits.ANSA0 = 1; // Ensure AN0/RA0 is analog
    ANSELAbits.ANSA1 = 1; // Ensure AN1/RA1 is analog
    ANSELBbits.ANSB1 = 1; // Ensure AN3/RB1 is analog

    ANSELCbits.ANSC1 = 0; // no 

    /* Initialize and enable ADC module */
    AD1CON1 = 0x04E4; // Enable simultaneous sampling and auto-sample //ASAM=1 SIAM=1
    AD1CON2 = 0x040C; // Sample 4 channels
    AD1CON3 = 0x0F0F;
    AD1CON4 = 0x0000;

    AD1CSSH = 0x0000;
    AD1CSSL = 0x000B;





    AD1CHS0bits.CH0SA = 3; // Select AN5 for CH0 +ve input
    AD1CHS0bits.CH0NA = 0; // Select Vref- for CH0 -ve input
    AD1CHS123bits.CH123SA = 0; // Select AN0 for CH1 +ve input
    // Select AN1 for CH2 +ve input
    // Select AN2 for CH3 +ve input
    AD1CHS123bits.CH123NA = 0; // Select Vref- for CH1/CH2/CH3 -ve inputs
    AD1CON1bits.ADON = 1;


}

void PrintInfo()
{
    printf("\n\r");

    printf("Bits per sample = %d\n\r", bitsPerSample);
    printf("Number of Channels = %d\n\r", numberOfChannels);
    printf("Sample Rate = %ld\n\r", sampleRate);
    printf("Data file size HEX =0x%2x%2x%2x%2x\n\r", receiveBuffer[43], receiveBuffer[42], receiveBuffer[41], receiveBuffer[40]);
    printf("Block align = %u\n\r", blockAlign);
}

void StreamIt()
{
    if (StreamStatus == Rolling)
    {
        if ((WavBuffer1State == Empty) || (WavBuffer2State == Empty))
        {
            if ((WavBuffer1State == Empty))
            {
                if (EventSound == Hit)
                    ReadAmountBuffer1 = FSfread(WavBuffer1, 1, WavBufferSize, HitFile);
                if (EventSound == Swing)
                    ReadAmountBuffer1 = FSfread(WavBuffer1, 1, WavBufferSize, SwgFile);
                if (EventSound == Won)
                    ReadAmountBuffer1 = FSfread(WavBuffer1, 1, WavBufferSize, WonFile);
                if (EventSound == On)
                    ReadAmountBuffer1 = FSfread(WavBuffer1, 1, WavBufferSize, OnFile);
                if (EventSound == Off)
                    ReadAmountBuffer1 = FSfread(WavBuffer1, 1, WavBufferSize, OffFile);

                if (ReadAmountBuffer1 > 0)
                    WavBuffer1State = Ready;
                else
                {
                    FSfseek(SwgFile, 44, 0);
                    FSfseek(HitFile, 44, 0);
                    FSfseek(WonFile, 44, 0);
                    FSfseek(OnFile, 44, 0);
                    FSfseek(OffFile, 44, 0);

                    EventSound = Won;
                }
            }
            else
            {
                if ((WavBuffer2State == Empty))
                {
                    if (EventSound == Hit)
                        ReadAmountBuffer2 = FSfread(WavBuffer2, 1, WavBufferSize, HitFile);
                    if (EventSound == Swing)
                        ReadAmountBuffer2 = FSfread(WavBuffer2, 1, WavBufferSize, SwgFile);
                    if (EventSound == Won)
                        ReadAmountBuffer2 = FSfread(WavBuffer2, 1, WavBufferSize, WonFile);
                    if (EventSound == On)
                        ReadAmountBuffer2 = FSfread(WavBuffer2, 1, WavBufferSize, OnFile);
                    if (EventSound == Off)
                        ReadAmountBuffer2 = FSfread(WavBuffer2, 1, WavBufferSize, OffFile);

                    if (ReadAmountBuffer2 > 0)
                        WavBuffer2State = Ready;
                    else
                    {
                        FSfseek(SwgFile, 44, 0);
                        FSfseek(HitFile, 44, 0);
                        FSfseek(WonFile, 44, 0);
                        FSfseek(OnFile, 44, 0);
                        FSfseek(OffFile, 44, 0);
                        EventSound = Won;
                    }
                }
            }
        }
    }
    return;
}

void PlayFiles(const char * FileName, const char * FileName2, const char * FileName3, const char * FileName4, const char * FileName5)
{
    if (StreamStatus == Waiting)
    {
        WonFile = FSfopen(FileName, "r");
        if (WonFile != NULL)
        {
            if (getWavHeader(receiveBuffer, WonFile) == allGood)
            {

            }
        }
        HitFile = FSfopen(FileName2, "r");
        if (HitFile != NULL)
        {
            if (getWavHeader(receiveBuffer, HitFile) == allGood)
            {

            }
        }


        SwgFile = FSfopen(FileName3, "r");
        if (SwgFile != NULL)
        {
            if (getWavHeader(receiveBuffer, SwgFile) == allGood)
            {


            }
        }

        OnFile = FSfopen(FileName4, "r");
        if (OnFile != NULL)
        {
            if (getWavHeader(receiveBuffer, OnFile) == allGood)
            {

            }
        }

        OffFile = FSfopen(FileName5, "r");
        if (OffFile != NULL)
        {
            if (getWavHeader(receiveBuffer, OffFile) == allGood)
            {

            }
        }
    }
    return;
}

void StopWav()
{
    T2CONbits.TON = 0;
    T1CONbits.TON = 0;
    IFS0bits.T1IF = 0;
    IFS0bits.T2IF = 0;

    StreamStatus = Waiting;
    WavBuffer1State = Empty;
    WavBuffer2State = Empty;
    WavBufferPos = 0;
    PBuffer = 0;
    FSfclose(WonFile);

    //T2CONbits.TON = 1;
    //T1CONbits.TON = 1;

}

void MyDelayms(UINT16 milliseconds)
{
    UINT16 ms;
    DWORD count;

    ms = milliseconds;
    while (ms--)
    {
        count = MILLISECDELAY;
        while (count--);
    }
    Nop();
    return;
}

void readADC()
{
    // AD1CON1bits.SAMP = 0; // Start the conversions
    while (!_AD1IF); // Wait for all 4 conversions to complete
    _AD1IF = 0; // Clear conversion done status bit

    AntADCValues[0] = ADCValues[0]; // Read the AN5 conversion result
    AntADCValues[1] = ADCValues[1]; // Read the AN0 conversion result
    AntADCValues[2] = ADCValues[2]; // Read the AN1 conversion result

    ADCValues[0] = ADC1BUF0; // Read the AN5 conversion result
    ADCValues[1] = ADC1BUF1; // Read the AN0 conversion result
    ADCValues[2] = ADC1BUF2; // Read the AN1 conversion result
    return;
}

void EuclidesDistance()
{
    int i;
    Euclides = 0;
    for (i = 0; i < 3; i++)
    {
        if (ADCValues[i] >= AntADCValues[i])
            DifADCValues[i] = ADCValues[i] - AntADCValues[i];
        else
            DifADCValues[i] = AntADCValues[i] - ADCValues[i];

        Euclides = Euclides + ((DifADCValues[i]) * DifADCValues[i]);
    }
    Euclides = sqrt(Euclides);
}

void OnBladeEffect()
{
    long pwm_d = 0;

    EventSound = On;

    while (pwm_d < 1000)
    {
        pwm_d = pwm_d + 2;
        PDC3 = pwm_d;
        PDC2 = pwm_d;
        PDC1 = pwm_d;
        MyDelayms(1);
    }

}

void OffBladeEffect()
{
    long pwm_d = 1000;

    EventSound = Off;

    while (pwm_d > 0)
    {
        pwm_d = pwm_d - 2;
        PDC3 = pwm_d;
        PDC2 = pwm_d;
        PDC1 = pwm_d;
        MyDelayms(1);
    }

}

int main(void)
{

    /*CALLING CONFIG*/
    /*INITIALIZING ALL SETTINGS*/
    InitOsc(); // SETTING OSC - FRC+PLL 
    InitPPS(); // SETTING PPS - ONLY UART AND SPI2
    InitU2(); // SETTING UART1 PARAMETERS
    SPI1Init(); // SETTING SPI1 PARAMETERS
    initTimer2(); //SETTING TIMER2 PARAMETERS
    SetupIO();
    InitADC();
    initPWM();
    /*END CONFIG UCONTROLLER*/


    while (!MDD_MediaDetect()); // WAITING FOR MEDIA
    while (!FSInit()); // WAITING FOR FILE SYSTEM
    /*PRE-LOADING ALL WAVES*/
    PlayFiles("IDLE1.wav", "STK2.wav", "SWG2.wav", "ON1.wav", "OFF1.wav");

    /*MAIN LOOP*/
    while (1)
    {
        /*WAITING FOR SW1 PRESS*/
        while (SW1 == 1); // WAITING FOR SWITCH 1 - LOCKED UNTIL BUTTON PRESS
        while (SW1 == 0);
        
        /*TURN ON INTERRUPTIONS AND THE ROLLING FLAG*/
        StreamStatus = Rolling;
        T2CONbits.TON = 1;
        T1CONbits.TON = 1;
        LED1 = 1;
        
        readADC();
        OnBladeEffect();
        readADC();

        while (1)
        {
            {
                if (SW1 == 0)
                {
                    while (SW1 == 0);
                    OffBladeEffect();
                    StreamStatus = Waiting;
                    T2CONbits.TON = 0;
                    T1CONbits.TON = 0;
                    LED1 = 0;

                    break;
                }

                
                MyDelayms(10); // Sample for 100 us

                readADC();
                EuclidesDistance();
                printf("%ld\n\r", Euclides);

                if ((Euclides > 350))
                {
                      EventSound = Hit;
                      MyDelayms(300);
                      readADC();
                      readADC();
                }
                else
                {
                    if (Euclides > 70) //70
                        // if ()
                    {
                        EventSound = Swing;
                        MyDelayms(100);
                        readADC();
                    }
                    else
                    {
                        // EventSound=Won;
                    }
                }
            }
        }
    }
}
//INTERRUPTION FOR READ THE FILE TO THE BUFFER

void __attribute__((__interrupt__, no_auto_psv)) _T1Interrupt(void)
{
    if (StreamStatus != Waiting)
    {
        StreamIt();
    }

    IFS0bits.T1IF = 0; //Clear Timer3 interrupt flag
}

//ITERRUPTION FOR SEND THE BUFFER TO DAC

void __attribute__((__interrupt__, no_auto_psv)) _T2Interrupt(void)
{
    if ((WavBuffer1State == Ready) && (PBuffer != 2))
    {
        PBuffer = 1;
        WriteDAC(WavBuffer1[WavBufferPos], WavBuffer1[WavBufferPos + 1]);
        WavBufferPos = WavBufferPos + 2;
        if (WavBufferPos >= ReadAmountBuffer1)
        {
            WavBuffer1State = Empty;
            WavBufferPos = 0;
            PBuffer = 0;
        }
    }
    else
    {
        if ((WavBuffer2State == Ready) && (PBuffer != 1))
        {
            PBuffer = 2;
            WriteDAC(WavBuffer2[WavBufferPos], WavBuffer2[WavBufferPos + 1]);
            WavBufferPos = WavBufferPos + 2;
            if (WavBufferPos >= ReadAmountBuffer2)
            {
                WavBuffer2State = Empty;
                WavBufferPos = 0;
                PBuffer = 0;
            }
        }
    }
    IFS0bits.T2IF = 0; //Clear Timer3 interrupt flag
}





