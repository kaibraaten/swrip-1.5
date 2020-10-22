cmake_minimum_required(VERSION 3.10)
include_directories(include/colorparser)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
set(COLORPARSER_SOURCES
  src/colorparser.cpp
  src/passthrough.cpp
  src/smaug2ansi.cpp
  src/smaug2html.cpp
  src/smaug_stripper.cpp)
add_library(colorparser SHARED ${COLORPARSER_SOURCES})
target_compile_features(colorparser PUBLIC cxx_std_20)
target_compile_options(colorparser
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation -std=c++20>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305 /std:c++latest>
  )
