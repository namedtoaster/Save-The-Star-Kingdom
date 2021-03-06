# Project definition
cmake_minimum_required(VERSION 3.1)
project(MyGame)

# Source files
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/source")
set(INC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")
set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libraries")
set(SOURCES
  "${SRC_DIR}/main.cpp"
  "${SRC_DIR}/Application.cpp"
  "${INC_DIR}/renderer/Renderer.cpp"
  "${INC_DIR}/shader/Shader.cpp"
  "${INC_DIR}/image/Image.cpp")

# Include Directory
include_directories(
  "${INC_DIR}/image"
  "${INC_DIR}/shader"
  "${INC_DIR}/state"
  "${INC_DIR}/renderer")

# Executable definition and properties
add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE "${SRC_DIR}")
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)

# GLFW
if (WIN32)
    set(GLFW_DIR "${LIB_DIR}/win_glfw")
endif (WIN32)
if (UNIX)
    set(GLFW_DIR "${LIB_DIR}/glfw")
endif (UNIX)
set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "Build the GLFW example programs")
set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "Build the GLFW test programs")
set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "Build the GLFW documentation")
set(GLFW_INSTALL OFF CACHE INTERNAL "Generate installation target")
add_subdirectory("${GLFW_DIR}")
target_link_libraries(${PROJECT_NAME} "glfw" "${GLFW_LIBRARIES}")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLFW_DIR}/include")

# glad
set(GLAD_DIR "${LIB_DIR}/glad")
add_library("glad" "${GLAD_DIR}/src/glad.c")
target_include_directories("glad" PRIVATE "${GLAD_DIR}/include")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")
target_link_libraries(${PROJECT_NAME} "glad" "${CMAKE_DL_LIBS}")
