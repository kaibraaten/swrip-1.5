cmake_minimum_required(VERSION 2.8.9)
project(mud)
include_directories(../libs .)
set(PROJECT_LINK_LIBS libcolorparser.so libutility.so)
link_directories(../libs/colorparser ../libs/utility)
set(CMAKE_BUILD_TYPE Debug)
set(GCC_WARNING_FLAGS "-Wall -Wshadow -Wformat-security -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Werror -Wwrite-strings -Wextra -Wno-char-subscripts -Wno-unused-parameter -Wno-implicit-fallthrough")
set(GCC_STD_FLAG "-std=c++14")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_WARNING_FLAGS} ${GCC_STD_FLAG}")
#file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true "*.cpp")
file(GLOB_RECURSE SOURCES "*.cpp")
list(FILTER SOURCES EXCLUDE REGEX "test\\/")
list(FILTER SOURCES EXCLUDE REGEX "CMakeFiles\\/")
add_library(mud SHARED ${SOURCES})
target_link_libraries(mud ${PROJECT_LINK_LIBS})
install(TARGETS mud DESTINATION /usr/lib)
add_custom_command(TARGET mud POST_BUILD
  COMMAND cmake .
  COMMAND make
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/test)
add_custom_command(TARGET mud POST_BUILD
  COMMAND ./test
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/test)
