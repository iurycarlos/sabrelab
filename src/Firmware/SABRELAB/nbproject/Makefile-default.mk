#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/MLA/JEDI_SDCARD/dsPIC33E_PIC24E/Demonstration1.c "../../Microchip/MDD File System/SD-SPI.c" "../../Microchip/MDD File System/FSIO.c" "../../Microchip/MDD File System/CONU2.c" ../LIBS/SPI_DAC8551.c ../LIBS/Timer2.c ../LIBS/Config.c ../LIBS/WavManager.c ../LIBS/IODefinitions.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/200869882/Demonstration1.o ${OBJECTDIR}/_ext/65885567/SD-SPI.o ${OBJECTDIR}/_ext/65885567/FSIO.o ${OBJECTDIR}/_ext/65885567/CONU2.o ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o ${OBJECTDIR}/_ext/761820803/Timer2.o ${OBJECTDIR}/_ext/761820803/Config.o ${OBJECTDIR}/_ext/761820803/WavManager.o ${OBJECTDIR}/_ext/761820803/IODefinitions.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/200869882/Demonstration1.o.d ${OBJECTDIR}/_ext/65885567/SD-SPI.o.d ${OBJECTDIR}/_ext/65885567/FSIO.o.d ${OBJECTDIR}/_ext/65885567/CONU2.o.d ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d ${OBJECTDIR}/_ext/761820803/Timer2.o.d ${OBJECTDIR}/_ext/761820803/Config.o.d ${OBJECTDIR}/_ext/761820803/WavManager.o.d ${OBJECTDIR}/_ext/761820803/IODefinitions.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/200869882/Demonstration1.o ${OBJECTDIR}/_ext/65885567/SD-SPI.o ${OBJECTDIR}/_ext/65885567/FSIO.o ${OBJECTDIR}/_ext/65885567/CONU2.o ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o ${OBJECTDIR}/_ext/761820803/Timer2.o ${OBJECTDIR}/_ext/761820803/Config.o ${OBJECTDIR}/_ext/761820803/WavManager.o ${OBJECTDIR}/_ext/761820803/IODefinitions.o

# Source Files
SOURCEFILES=C:/MLA/JEDI_SDCARD/dsPIC33E_PIC24E/Demonstration1.c ../../Microchip/MDD File System/SD-SPI.c ../../Microchip/MDD File System/FSIO.c ../../Microchip/MDD File System/CONU2.c ../LIBS/SPI_DAC8551.c ../LIBS/Timer2.c ../LIBS/Config.c ../LIBS/WavManager.c ../LIBS/IODefinitions.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24EP256MC204
MP_LINKER_FILE_OPTION=,--script=p24EP256MC204.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/200869882/Demonstration1.o: C:/MLA/JEDI_SDCARD/dsPIC33E_PIC24E/Demonstration1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/200869882" 
	@${RM} ${OBJECTDIR}/_ext/200869882/Demonstration1.o.d 
	@${RM} ${OBJECTDIR}/_ext/200869882/Demonstration1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/MLA/JEDI_SDCARD/dsPIC33E_PIC24E/Demonstration1.c  -o ${OBJECTDIR}/_ext/200869882/Demonstration1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/200869882/Demonstration1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/200869882/Demonstration1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/65885567/SD-SPI.o: ../../Microchip/MDD\ File\ System/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/65885567" 
	@${RM} ${OBJECTDIR}/_ext/65885567/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/65885567/SD-SPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../Microchip/MDD File System/SD-SPI.c"  -o ${OBJECTDIR}/_ext/65885567/SD-SPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/65885567/SD-SPI.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/65885567/SD-SPI.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/65885567/FSIO.o: ../../Microchip/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/65885567" 
	@${RM} ${OBJECTDIR}/_ext/65885567/FSIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/65885567/FSIO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../Microchip/MDD File System/FSIO.c"  -o ${OBJECTDIR}/_ext/65885567/FSIO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/65885567/FSIO.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/65885567/FSIO.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/65885567/CONU2.o: ../../Microchip/MDD\ File\ System/CONU2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/65885567" 
	@${RM} ${OBJECTDIR}/_ext/65885567/CONU2.o.d 
	@${RM} ${OBJECTDIR}/_ext/65885567/CONU2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../Microchip/MDD File System/CONU2.c"  -o ${OBJECTDIR}/_ext/65885567/CONU2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/65885567/CONU2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/65885567/CONU2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o: ../LIBS/SPI_DAC8551.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/SPI_DAC8551.c  -o ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/Timer2.o: ../LIBS/Timer2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/Timer2.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/Timer2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/Timer2.c  -o ${OBJECTDIR}/_ext/761820803/Timer2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/Timer2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/Timer2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/Config.o: ../LIBS/Config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/Config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/Config.c  -o ${OBJECTDIR}/_ext/761820803/Config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/Config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/Config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/WavManager.o: ../LIBS/WavManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/WavManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/WavManager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/WavManager.c  -o ${OBJECTDIR}/_ext/761820803/WavManager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/WavManager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/WavManager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/IODefinitions.o: ../LIBS/IODefinitions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/IODefinitions.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/IODefinitions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/IODefinitions.c  -o ${OBJECTDIR}/_ext/761820803/IODefinitions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/IODefinitions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/IODefinitions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/200869882/Demonstration1.o: C:/MLA/JEDI_SDCARD/dsPIC33E_PIC24E/Demonstration1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/200869882" 
	@${RM} ${OBJECTDIR}/_ext/200869882/Demonstration1.o.d 
	@${RM} ${OBJECTDIR}/_ext/200869882/Demonstration1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/MLA/JEDI_SDCARD/dsPIC33E_PIC24E/Demonstration1.c  -o ${OBJECTDIR}/_ext/200869882/Demonstration1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/200869882/Demonstration1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/200869882/Demonstration1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/65885567/SD-SPI.o: ../../Microchip/MDD\ File\ System/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/65885567" 
	@${RM} ${OBJECTDIR}/_ext/65885567/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/65885567/SD-SPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../Microchip/MDD File System/SD-SPI.c"  -o ${OBJECTDIR}/_ext/65885567/SD-SPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/65885567/SD-SPI.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/65885567/SD-SPI.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/65885567/FSIO.o: ../../Microchip/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/65885567" 
	@${RM} ${OBJECTDIR}/_ext/65885567/FSIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/65885567/FSIO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../Microchip/MDD File System/FSIO.c"  -o ${OBJECTDIR}/_ext/65885567/FSIO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/65885567/FSIO.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/65885567/FSIO.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/65885567/CONU2.o: ../../Microchip/MDD\ File\ System/CONU2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/65885567" 
	@${RM} ${OBJECTDIR}/_ext/65885567/CONU2.o.d 
	@${RM} ${OBJECTDIR}/_ext/65885567/CONU2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../Microchip/MDD File System/CONU2.c"  -o ${OBJECTDIR}/_ext/65885567/CONU2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/65885567/CONU2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/65885567/CONU2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o: ../LIBS/SPI_DAC8551.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/SPI_DAC8551.c  -o ${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/SPI_DAC8551.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/Timer2.o: ../LIBS/Timer2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/Timer2.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/Timer2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/Timer2.c  -o ${OBJECTDIR}/_ext/761820803/Timer2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/Timer2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/Timer2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/Config.o: ../LIBS/Config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/Config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/Config.c  -o ${OBJECTDIR}/_ext/761820803/Config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/Config.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/Config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/WavManager.o: ../LIBS/WavManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/WavManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/WavManager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/WavManager.c  -o ${OBJECTDIR}/_ext/761820803/WavManager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/WavManager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/WavManager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/761820803/IODefinitions.o: ../LIBS/IODefinitions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/761820803" 
	@${RM} ${OBJECTDIR}/_ext/761820803/IODefinitions.o.d 
	@${RM} ${OBJECTDIR}/_ext/761820803/IODefinitions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIBS/IODefinitions.c  -o ${OBJECTDIR}/_ext/761820803/IODefinitions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820803/IODefinitions.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../../../MDD File System-SD Card" -I"../../../MDD File System-SD Card/dsPIC33E_PIC24E" -I"../../../Microchip/Include" -I"../../../Microchip/Include/MDD File System" -I"../../Include" -I"../../Include/MDD File System" -I"../../Microchip/Include" -I"../../Microchip/Include/MDD File System" -I"../dsPIC33E_PIC24E" -I"." -msmart-io=1 -Wall -msfr-warn=off   -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820803/IODefinitions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/MDDFS-SD-Exp_16_Board-PIC24EP512GU810_PIM.X.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/MDDFS-SD-Exp_16_Board-PIC24EP512GU810_PIM.X.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/JEDI.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
