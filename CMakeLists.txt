cmake_minimum_required(VERSION 3.31)
project(jjld_project)

add_executable(jjld src/jjld.cpp)

set_property(TARGET jjld PROPERTY CXX_STANDARD 20)