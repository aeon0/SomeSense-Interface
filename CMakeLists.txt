cmake_minimum_required(VERSION 3.16)
set(COMPONENT_NAME "interface")

find_package(CapnProto REQUIRED)

# Generate the .h and .cxx files
file(GLOB_RECURSE CAPNP_FILES *.capnp)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/_gen)
set(CAPNPC_OUTPUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/_gen" CACHE STRING "" FORCE)
capnp_generate_cpp(CAPNP_SRCS CAPNP_HDRS ${CAPNP_FILES})

add_library(lib${COMPONENT_NAME} STATIC
  ${CAPNP_SRCS}
  ${CAPNP_HDRS}
)

target_include_directories(lib${COMPONENT_NAME} SYSTEM
  PUBLIC
  ${CAPNP_INCLUDE_DIRS}
)
