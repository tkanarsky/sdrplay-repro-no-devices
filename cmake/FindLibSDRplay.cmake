# Cribbed from https://github.com/pothosware/SoapySDRPlay3/blob/master/FindLibSDRplay.cmake

if(NOT LIBSDRPLAY_FOUND)
    # pkg_check_modules (LIBSDRPLAY_PKG libsdrplay)

    IF(WIN32)
        GET_FILENAME_COMPONENT(SDRPLAY_API_DIR "[HKEY_LOCAL_MACHINE\\SOFTWARE\\SDRplay\\Service\\API;Install_Dir]" ABSOLUTE)

        if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
            MESSAGE( "64 bit compiler detected" )
            SET( EX_PLATFORM 64 )
            SET( EX_PLATFORM_NAME "x64" )
        else( CMAKE_SIZEOF_VOID_P EQUAL 8 )
            MESSAGE( "32 bit compiler detected" )
            SET( EX_PLATFORM 32 )
            SET( EX_PLATFORM_NAME "x86" )
        endif( CMAKE_SIZEOF_VOID_P EQUAL 8 )

        find_path(LIBSDRPLAY_INCLUDE_DIRS NAMES sdrplay_api.h
                PATHS
                "${SDRPLAY_API_DIR}/inc"
                )

        find_library(LIBSDRPLAY_LIBRARIES NAMES sdrplay_api.lib
                PATHS
                "${SDRPLAY_API_DIR}/${EX_PLATFORM_NAME}"
                )
    ELSE()
        find_path(LIBSDRPLAY_INCLUDE_DIRS NAMES sdrplay_api.h
                PATHS
                /usr/include
                /usr/local/include
                )

        find_library(LIBSDRPLAY_LIBRARIES NAMES sdrplay_api
                PATHS
                /usr/lib
                /usr/local/lib
                )
    ENDIF()
    # ${LIBSDRPLAY_PKG_INCLUDE_DIRS}
    # ${LIBSDRPLAY_PKG_LIBRARY_DIRS}

    if(LIBSDRPLAY_INCLUDE_DIRS AND LIBSDRPLAY_LIBRARIES)
        set(LIBSDRPLAY_FOUND TRUE CACHE INTERNAL "libsdrplay found")
        message(STATUS "Found libsdrplay: ${LIBSDRPLAY_INCLUDE_DIRS}, ${LIBSDRPLAY_LIBRARIES}")
    else(LIBSDRPLAY_INCLUDE_DIRS AND LIBSDRPLAY_LIBRARIES)
        set(LIBSDRPLAY_FOUND FALSE CACHE INTERNAL "libsdrplay found")
        message(STATUS "libsdrplay not found.")
    endif(LIBSDRPLAY_INCLUDE_DIRS AND LIBSDRPLAY_LIBRARIES)

    #mark_as_advanced(LIBSDRPLAY_LIBRARIES LIBSDRPLAY_INCLUDE_DIRS)

endif(NOT LIBSDRPLAY_FOUND)
