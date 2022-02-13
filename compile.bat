@echo off

set name="papong"

set path=%path%;D:\Installations\cc65-snapshot-win32\bin\

cc65 -Oirs %name%.c --add-source
ca65 crt0.s
ca65 %name%.s -g

ld65 -C nrom_32k_vert.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln labels.txt

del *.o

move /Y labels.txt build\
move /Y %name%.s build\\
move /Y %name%.nes build\\
