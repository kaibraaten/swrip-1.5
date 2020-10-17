cmake_minimum_required(VERSION 3.10)
include_directories(include)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(imp SHARED
   "src/scanner/scanner.cpp"
   "src/scanner/tokenkind.cpp"
   "src/except/impexception.cpp"
   "src/except/scannerexception.cpp"
   "src/scanner/token.cpp"
   "src/parser/impsyntax.cpp"
   "src/except/parserexception.cpp"
   "src/parser/andtest.cpp"
   "src/parser/nottest.cpp"
   "src/parser/comparison.cpp"
   "src/parser/compopr.cpp" "include/imp/parser/termopr.hpp" "src/parser/termopr.cpp" "include/imp/parser/term.hpp" "src/parser/term.cpp")
target_compile_features(imp PUBLIC cxx_std_17)
target_compile_options(imp
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /wd4244 /wd4267>
)
if(WIN32)
  target_link_libraries(imp WS2_32)
#else()
#  target_link_libraries(utility stdc++fs)
endif()
add_subdirectory(test)
