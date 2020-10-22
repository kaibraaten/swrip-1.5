cmake_minimum_required(VERSION 3.10)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_executable(runimp main.cpp)
target_compile_features(runimp PRIVATE cxx_std_20)
target_compile_options(runimp
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation -std::c++20>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305 /std:c++latest>
  )
target_link_libraries(runimp imp)
  
