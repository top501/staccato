cmake_minimum_required(VERSION 2.8)

set(target mergesort-sequential)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -g")

add_executable(${target} main.cpp)
