cmake_minimum_required(VERSION 3.0)
project(ci_test)

set(CMAKE_CXX_STANDARD 11)

set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)
set(LIBS_DIR ${CMAKE_SOURCE_DIR}/libs)
set(LIBS_INCLUDE_DIR ${LIBS_DIR}/include)
set(LIBS_LIB_DIR ${LIBS_DIR}/lib)

# configure
if($VERSION MATCHES "")
    execute_process(COMMAND git rev-parse --short HEAD OUTPUT_VARIABLE VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()
message(STATUS "VERSION:${VERSION}")
configure_file(${CMAKE_SOURCE_DIR}/config.h.in ${SRC_DIR}/config.h)

# build
file(GLOB_RECURSE SOURCES ${SRC_DIR}/*.cpp ${SRC_DIR}/**/*.cpp ${SRC_DIR}/*.h ${SRC_DIR}/**/*.h)
add_library(ci_test ${SOURCES})
target_include_directories(ci_test PUBLIC ${LIBS_INCLUDE_DIR})


# test
set(TEST_ROOT_DIR ${CMAKE_SOURCE_DIR}/test)
set(TEST_SRC_DIR ${TEST_ROOT_DIR}/src)
set(TEST_LIBS_DIR ${TEST_ROOT_DIR}/libs)
set(TEST_LIBS_INCLUDE_DIR ${TEST_LIBS_DIR}/include)
set(TEST_LIBS_LIB_DIR ${TEST_LIBS_DIR}/lib)
