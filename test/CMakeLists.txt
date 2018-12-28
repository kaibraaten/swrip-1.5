cmake_minimum_required(VERSION 3.11)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
include(GoogleTest)
enable_testing()
add_executable(mud_tests
  src/alias_tests.cpp
  src/arraydatatests.cpp
  src/craft_tests.cpp
  src/flag_tests.cpp
  src/main.cpp
  src/commands/follow_tests.cpp
  )
target_compile_features(mud_tests PRIVATE cxx_std_17)
target_compile_options(mud_tests
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/DDEACTIVATE_FAILING_TESTS /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /DGTEST_LINKED_AS_SHARED_LIBRARY=1 /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305>)
target_link_libraries(mud_tests mud gtest_main gmock)
target_include_directories(mud_tests PRIVATE src)
gtest_discover_tests(mud_tests)
add_custom_command(TARGET mud_tests
  POST_BUILD
  COMMAND ctest)