#define allGood             0
#define incorrectHeaderSize 1
#define riff                2
#define wav                 3
#define fmt                 4
#define notPCM              5


UINT8 getWavHeader(UINT8 * receiveBuffer, FSFILE * pointer);
void getParameters(UINT8 * receiveBuffer, UINT8 * bitsPerSample, UINT8 * numberOfChannels, UINT32 * dataSize, UINT32 * sampleRate, UINT32 * blockAlign);