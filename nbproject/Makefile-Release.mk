#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=MinGW-Windows
CND_DLIB_EXT=dll
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/_m1messages.o \
	${OBJECTDIR}/src/_m2metodosLineales.o \
	${OBJECTDIR}/src/cTuberiaSimple.o \
	${OBJECTDIR}/src/dTuberiaSimple.o \
	${OBJECTDIR}/src/main.o \
	${OBJECTDIR}/src/pTuberiaSimple.o \
	${OBJECTDIR}/src/test.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/desing_pipes.exe

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/desing_pipes.exe: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.f} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/desing_pipes ${OBJECTFILES} ${LDLIBSOPTIONS} -static C:\MinGW\bin\libgfortran-3.dll C:\MinGW\bin\libgcc_s_dw2-1.dll

${OBJECTDIR}/src/_m1messages.o: src/_m1messages.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/_m1messages.o src/_m1messages.f90

${OBJECTDIR}/src/_m2metodosLineales.o: src/_m2metodosLineales.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/_m2metodosLineales.o src/_m2metodosLineales.f90

${OBJECTDIR}/src/cTuberiaSimple.o: src/cTuberiaSimple.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/cTuberiaSimple.o src/cTuberiaSimple.f90

${OBJECTDIR}/src/dTuberiaSimple.o: src/dTuberiaSimple.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/dTuberiaSimple.o src/dTuberiaSimple.f90

${OBJECTDIR}/src/main.o: src/main.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/main.o src/main.f90

${OBJECTDIR}/src/pTuberiaSimple.o: src/pTuberiaSimple.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/pTuberiaSimple.o src/pTuberiaSimple.f90

${OBJECTDIR}/src/test.o: src/test.f90
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/test.o src/test.f90

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
