cmake_minimum_required(VERSION 2.8.9)
project(colorparser)
set(CMAKE_BUILD_TYPE Debug)
set(GCC_WARNING_FLAGS "-Wall -Wshadow -Wformat-security -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Werror -Wwrite-strings -Wextra -Wno-char-subscripts")
set(GCC_STD_FLAG "-std=c++14")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_WARNING_FLAGS} ${GCC_STD_FLAG}")
set(SOURCES
  colorparser.cpp
  passthrough.cpp
  smaug2ansi.cpp
  smaug2html.cpp
  smaug_stripper.cpp)
add_library(colorparser SHARED ${SOURCES})
