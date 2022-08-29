
#include "../LIBS/IODefinitions.h"

void SetupIO()
{
    /*SET THIS PINS LIKE DIGITAL IO / NO ANALOG*/
    ANSELCbits.ANSC0 = 0; // no 
    ANSELCbits.ANSC1 = 0; // no 
    ANSELCbits.ANSC2 = 0; // no 
    
    /*SET THIS PINS LIKE TRISTATE OUTPUT*/
    TRIS_LED1 = 0;
    TRIS_LED2 = 0;
    TRIS_LED3 = 0;
    
    /*SET THIS PINS LIKE TRISTATE INPUT*/
    TRIS_SW1 = 1;
    TRIS_SW2 = 1;
    TRIS_SW3 = 1;

}
