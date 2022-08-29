
#include "xc.h"
#include "GenericTypeDefs.h"
#include "FSIO.h"
#include "WavManager.h"

UINT8 getWavHeader(UINT8 * receiveBuffer, FSFILE * pointer) {

    if (FSfread(receiveBuffer, 1, 44, pointer) != 44) {
        return incorrectHeaderSize;
    }

    if ((receiveBuffer[0] != 'R') |
            (receiveBuffer[1] != 'I') |
            (receiveBuffer[2] != 'F') |
            (receiveBuffer[3] != 'F')) {
        return riff;
    }

    if ((receiveBuffer[8] != 'W') |
            (receiveBuffer[9] != 'A') |
            (receiveBuffer[10] != 'V') |
            (receiveBuffer[11] != 'E')) {
        return wav;
    }

    if ((receiveBuffer[12] != 'f') |
            (receiveBuffer[13] != 'm') |
            (receiveBuffer[14] != 't')) {
        return fmt;
    }

    if (receiveBuffer[20] != 1) {
        return notPCM;
    }

    return allGood; // no errors

}

void getParameters(UINT8 * receiveBuffer, UINT8 * bitsPerSample, UINT8 * numberOfChannels, UINT32 * dataSize, UINT32 * sampleRate, UINT32 * blockAlign) 
{
    *bitsPerSample = receiveBuffer[34];
    *numberOfChannels = receiveBuffer[22];
    *sampleRate = (receiveBuffer[25] << 8) | receiveBuffer[24];
    *dataSize = (receiveBuffer[43] << 24) | (receiveBuffer[42] << 16) | (receiveBuffer[41] << 8) |  receiveBuffer[40];
    *blockAlign = receiveBuffer[32];
    return;
}
