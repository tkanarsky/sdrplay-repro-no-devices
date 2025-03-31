cmake_minimum_required(VERSION 3.9)
project(test-sdrplay-api CXX C)
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/cmake)


find_package(LibSDRplay)
if(NOT LIBSDRPLAY_FOUND)
    MESSAGE(FATAL_ERROR "SDRplay API driver not found... Please visit sdrplay, download and install API driver version 3.x")
endif (NOT LIBSDRPLAY_FOUND)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE ${LIBSDRPLAY_LIBRARIES})
target_include_directories(main PRIVATE ${LIBSDRPLAY_INCLUDE_DIRS})
add_custom_command(TARGET main POST_BUILD
    COMMENT "Changing dylib load path to the correct one"
    COMMAND sudo install_name_tool -change libsdrplay_api.so.3 /Library/SDRplayAPI/3.15.0/lib/libsdrplay_api.so.3 ./main
)
