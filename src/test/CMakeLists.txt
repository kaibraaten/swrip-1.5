cmake_minimum_required(VERSION 2.8.9)
project(test)
include_directories(.. ../../libs .)
set(PROJECT_LINK_LIBS libmud.so libcolorparser.so libutility.so libgtest.so libgmock.so liblua.so)
link_directories(.. ../../libs/colorparser ../../libs/utility)
set(CMAKE_BUILD_TYPE Debug)
set(GCC_WARNING_FLAGS "-Wall -Wshadow -Wformat-security -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Werror -Wwrite-strings -Wextra -Wno-char-subscripts -Wno-unused-parameter -Wno-implicit-fallthrough -Wno-unused-result")
set(GCC_STD_FLAG "-std=c++14")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_WARNING_FLAGS} ${GCC_STD_FLAG}")
set(SOURCES
  alias_tests.cpp
  arraydatatests.cpp
  craft_tests.cpp
  flag_tests.cpp
  main.cpp)
add_executable(test ${SOURCES})
target_link_libraries(test ${PROJECT_LINK_LIBS})
add_custom_command(TARGET test POST_BUILD
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/test
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
