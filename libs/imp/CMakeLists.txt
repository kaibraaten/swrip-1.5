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
   "src/parser/compopr.cpp" "include/imp/parser/termopr.hpp" "src/parser/termopr.cpp" "include/imp/parser/term.hpp" "src/parser/term.cpp" "include/imp/parser/factor.hpp" "src/parser/factor.cpp" "include/imp/parser/factorprefix.hpp" "src/parser/factorprefix.cpp" "include/imp/parser/factoropr.hpp" "src/parser/factoropr.cpp" "include/imp/parser/primary.hpp" "src/parser/primary.cpp" "src/parser/primarysuffix.cpp" "include/imp/parser/primarysuffix.hpp" "include/imp/parser/subscription.hpp" "src/parser/subscription.cpp" "include/imp/parser/arguments.hpp" "src/parser/arguments.cpp" "include/imp/parser/expr.hpp" "src/parser/expr.cpp" "include/imp/parser/atom.hpp" "src/parser/atom.cpp" "include/imp/parser/booleanliteral.hpp" "src/parser/booleanliteral.cpp" "src/parser/floatliteral.cpp" "include/imp/parser/floatliteral.hpp" "include/imp/parser/integerliteral.hpp" "src/parser/integerliteral.cpp" "include/imp/parser/stringliteral.hpp" "src/parser/stringliteral.cpp" "src/parser/noneliteral.cpp" "include/imp/parser/noneliteral.hpp" "include/imp/parser/innerexpr.hpp" "src/parser/innerexpr.cpp" "include/imp/parser/name.hpp" "src/parser/name.cpp" "src/parser/dictdisplay.cpp" "include/imp/parser/dictdisplay.hpp")
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
