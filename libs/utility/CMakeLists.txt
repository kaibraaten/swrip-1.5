cmake_minimum_required(VERSION 2.8.9)
project(utility)
include_directories(../)
set(CMAKE_BUILD_TYPE Debug)
set(GCC_WARNING_FLAGS "-Wall -Wshadow -Wformat-security -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Werror -Wwrite-strings -Wextra -Wno-char-subscripts")
set(GCC_STD_FLAG "-std=c++14")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_WARNING_FLAGS} ${GCC_STD_FLAG}")
set(SOURCES
  bet.cpp
  file_io.cpp
  linkedlist.cpp
  misc.cpp
  oldrepository.cpp
  os_posix.cpp
  os_win32.cpp
  random.cpp
  repositorybase.cpp
  sha256.cpp
  string_handling.cpp
  time_fun.cpp
  vector3.cpp)
add_library(utility SHARED ${SOURCES})
