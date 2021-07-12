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
copy lua.h bin\lua.h
copy lua.hpp bin\lua.hpp
copy lua.c bin\lua.c
copy lauxlib.h bin\lauxlib.h
copy lauxlib.c bin\lauxlib.c
copy lualib.h bin\lualib.h
copy luaconf.h bin\luaconf.h