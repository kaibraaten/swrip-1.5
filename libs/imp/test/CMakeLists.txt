cmake_minimum_required(VERSION 3.10)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
include(GoogleTest)
enable_testing()
add_executable(imp_tests
    src/scanner/tokenkind_tests.cpp
   "src/main.cpp" "src/scanner/scanner_tests.cpp")
target_compile_features(imp_tests PRIVATE cxx_std_17)
target_compile_options(imp_tests
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/DDEACTIVATE_FAILING_TESTS /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /DGTEST_LINKED_AS_SHARED_LIBRARY=1 /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305>
  )
target_link_libraries(imp_tests gtest_main gmock imp)
gtest_discover_tests(imp_tests)
add_custom_command(TARGET imp_tests
  POST_BUILD
  COMMAND ctest --output-on-failure)
