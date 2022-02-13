#!/usr/bin/env sh

PAPONG_FILENAME=papong

echo " - Compiling ${PAPONG_FILENAME}.c...";

cc65 -Oirs ${PAPONG_FILENAME}.c --add-source -W-pointer-sign;

if [ "$?" != "0" ] ; then
  exit 1;
fi

echo " - Assembling...";

ca65 crt0.s;

if [ "$?" != "0" ] ; then
  exit 1;
fi

ca65 ${PAPONG_FILENAME}.s -g;

echo " - Linking...";

ld65 -C nrom_32k_vert.cfg -o ${PAPONG_FILENAME}.nes crt0.o ${PAPONG_FILENAME}.o nes.lib -Ln labels.txt;

if [ "$?" != "0" ] ; then
  exit 1;
fi

echo " - Removing object files...";

rm -f *.o

echo " - Moving results to "build" directory..."

mv labels.txt ${PAPONG_FILENAME}.s ${PAPONG_FILENAME}.nes ./build;

echo " - Done! Rom file: build/${PAPONG_FILENAME}.nes";