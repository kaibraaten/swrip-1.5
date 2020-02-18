cmake_minimum_required(VERSION 3.10)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(lua SHARED
    lapi.c
    lapi.h
    lauxlib.c
    lauxlib.h
    lbaselib.c
    lbitlib.c
    lcode.c
    lcode.h
    lcorolib.c
    lctype.c
    lctype.h
    ldblib.c
    ldebug.c
    ldebug.h
    ldo.c
    ldo.h
    ldump.c
    lfunc.c
    lfunc.h
    lgc.c
    lgc.h
    linit.c
    liolib.c
    llex.c
    llex.h
    llimits.h
    lmathlib.c
    lmem.c
    lmem.h
    loadlib.c
    lobject.c
    lopcodes.c
    lopcodes.h
    loslib.c
    lparser.c
    lparser.h
    lprefix.h
    lstate.c
    lstate.h
    lstring.c
    lstring.h
    lstrlib.c
    ltable.c
    ltable.h
    ltablib.c
    ltm.c
    ltm.h
    luaconf.h
    lua.h
    lua.hpp
    lualib.h
    lundump.c
    lundump.h
    lutf8lib.c
    lvm.c
    lvm.h
    lzio.c
    lzio.h
)
target_compile_options(lua
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/DLUA_BUILD_AS_DLL /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305>
)
