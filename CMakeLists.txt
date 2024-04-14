cmake_minimum_required(VERSION 3.10)
project(box2d LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Static runtime
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Release>:Release>")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Distribution>:Distribution>")

# Output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}")


# Files
file(GLOB_RECURSE SOURCE_FILES 
    "src/*.cpp" 
    "src/*.h" 
    "include/*.h"
    "../../glm/glm/*.hpp"
    "../../glm/glm/*.inl"
    "../../glm/glm/glx/*.hpp"
    "../../glm/glm/glx/*.inl"
)

# Define the target
add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    "include"
    "src"
    "../../glm/glm"
)

# Configuration-specific settings
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(box2d PRIVATE $<$<CONFIG:Debug>:/MTd>)
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_options(box2d PRIVATE $<$<CONFIG:Release>:/MT>)
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Distribution")
    target_compile_options(box2d PRIVATE $<$<CONFIG:Distribution>:/MT>)
endif()