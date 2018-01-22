cmake_minimum_required(VERSION 3.0.0)

project(sndfile.bodged)

add_subdirectory(sndfile)

set_target_properties(sndfile-shared PROPERTIES
  OUTPUT_NAME sndfile
  VERSION bodged
  SOVERSION bodged
  POSITION_INDEPENDENT_CODE ON)

if (WIN32)
   set_target_properties(sndfile-shared PROPERTIES
     PREFIX lib
     SUFFIX .dll.bodged)
endif()
