@echo off
cd src
rmdir /S /Q bin
mkdir bin
call VsDevCmd.bat
cl /MD /O2 /c /DLUA_BUILD_AS_DLL *.c
ren lua.obj lua.o
ren luac.obj luac.o
link /DLL /IMPLIB:bin\lua.lib /OUT:bin\lua.dll *.obj
link /OUT:bin\lua.exe lua.o bin\lua.lib
lib /OUT:bin\lua-static.lib *.obj
link /OUT:bin\luac.exe luac.o bin\lua-static.lib
move lua.h bin\lua.h
move lua.hpp bin\lua.hpp
move lua.c bin\lua.c
move lauxlib.h bin\lauxlib.h
move lauxlib.c bin\lauxlib.c
move lualib.h bin\lualib.h