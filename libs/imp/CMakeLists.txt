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
   "src/parser/compopr.cpp"
   "src/parser/termopr.cpp"
   "src/parser/term.cpp"
   "src/parser/factor.cpp"
   "src/parser/factorprefix.cpp"
   "src/parser/factoropr.cpp"
   "src/parser/primary.cpp"
   "src/parser/primarysuffix.cpp"
   "src/parser/subscription.cpp"
   "src/parser/arguments.cpp"
   "src/parser/expr.cpp"
   "src/parser/atom.cpp"
   "src/parser/booleanliteral.cpp"
   "src/parser/floatliteral.cpp"
   "src/parser/integerliteral.cpp"
   "src/parser/stringliteral.cpp"
   "src/parser/noneliteral.cpp"
   "src/parser/innerexpr.cpp"
   "src/parser/name.cpp"
   "src/parser/dictdisplay.cpp"
   "src/parser/listdisplay.cpp"
   "src/parser/lambda.cpp"
   "src/parser/statement.cpp" "src/parser/compoundstmt.cpp" "include/imp/parser/forstmt.hpp" "src/parser/forstmt.cpp" "include/imp/parser/ifstmt.hpp" "src/parser/ifstmt.cpp" "src/parser/whilestmt.cpp" "include/imp/parser/whilestmt.hpp" "include/imp/parser/funcdef.hpp" "src/parser/funcdef.cpp" "include/imp/parser/smallstmtlist.hpp" "src/parser/smallstmtlist.cpp" "src/parser/smallstmt.cpp" "include/imp/parser/smallstmt.hpp" "include/imp/parser/passstmt.hpp" "src/parser/passstmt.cpp" "src/parser/returnstmt.cpp" "include/imp/parser/returnstmt.hpp" "include/imp/parser/exprstmt.hpp" "src/parser/exprstmt.cpp")
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
