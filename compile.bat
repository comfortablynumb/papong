@echo off

set name="papong"

set path=%path%;D:\Installations\cc65-snapshot-win32\bin\

set CC65_HOME=D:\Installations\cc65-snapshot-win32\

cc65 -Oirs %name%.c --add-source
ca65 crt0.s
ca65 %name%.s -g

ld65 -C nrom_32k_vert.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln labels.txt

del *.o

move /Y labels.txt BUILD\ 
move /Y %name%.s BUILD\ 
move /Y %name%.nes BUILD\

D:\Downloads\NES\Mesen.0.9.9\Mesen.exe BUILD\%name%.nes
