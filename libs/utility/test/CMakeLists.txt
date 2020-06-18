cmake_minimum_required(VERSION 3.10)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
include(GoogleTest)
enable_testing()
add_executable(utility_tests
  src/algorithms_tests.cpp
  src/bet_tests.cpp
  src/event_tests.cpp
  src/learning_tests.cpp
  src/main.cpp
  src/misc_tests.cpp
  src/repository_tests.cpp
  src/string_handling_tests.cpp
  )
target_compile_features(utility_tests PRIVATE cxx_std_17)
target_compile_options(utility_tests
  PRIVATE $<$<CXX_COMPILER_ID:GNU>:-Werror -Wall -Wformat-security -Wshadow -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Wextra -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-sign-compare -Wno-write-strings -Wno-format-truncation>
  PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/DDEACTIVATE_FAILING_TESTS /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE /DGTEST_LINKED_AS_SHARED_LIBRARY=1 /wd4996 /wd6262 /wd26451 /wd4267 /wd4244 /wd4018 /we4805 /we4305>
  )
target_link_libraries(utility_tests gtest_main gmock utility)
gtest_discover_tests(utility_tests)
#add_custom_command(TARGET utility_tests
#  POST_BUILD
#  COMMAND ctest)
#  COMMAND ctest --output-on-failure)
