cmake_minimum_required(VERSION 3.16)
set(COMPONENT_NAME "interface")

set(CMAKE_STATIC_LIBRARY_PREFIX "")
find_package(Protobuf REQUIRED)

# Generate the .h and .cxx files
file(GLOB_RECURSE PROTO_FILES *.proto)
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS ${PROTO_FILES})

add_library(lib${COMPONENT_NAME} STATIC
  ${PROTO_SRCS}
  ${PROTO_HDRS}
)
target_include_directories(lib${COMPONENT_NAME} SYSTEM
  PUBLIC
  ${CMAKE_CURRENT_BINARY_DIR}
)
