cmake_minimum_required( VERSION 2.8 )
project( serialToImu )

set( CMAKE_BUILD_TYPE Debug )
set( CMAKE_CXX_FLAGS "-std=c++11 -O3" )

add_executable( serialToImu src/serialToImu.cpp )
target_link_libraries( serialToImu )

