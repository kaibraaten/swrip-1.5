cmake_minimum_required(VERSION 3.11)
set(CMAKE_BUILD_TYPE Debug)
add_library(utility SHARED
  src/bet.cpp
  src/file_io.cpp
  src/linkedlist.cpp
  src/misc.cpp
  src/oldrepository.cpp
  src/os_posix.cpp
  src/os_win32.cpp
  src/random.cpp
  src/repositorybase.cpp
  src/sha256.cpp
  src/string_handling.cpp
  src/time_fun.cpp
  src/vector3.cpp
  )
target_compile_features(utility PUBLIC cxx_std_14)
target_compile_options(utility
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305>
)
