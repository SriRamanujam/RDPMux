# - Try to find FreeRDP/winpr
# Once done this will define
#
#  FREERDP_FOUND - system has FreeRDP/winpr
#  FREERDP_INCLUDE_DIRS - the FreeRDP/winpr include directories
#  FREERDP_LIBRARIES - FreeRDP/winpr libraries

find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
    pkg_check_modules(PC_FREERDP freerdp2)
endif()

set(FREERDP_DEFINITIONS ${PC_FREERDP_CFLAGS_OTHER})

find_path(FREERDP_INCLUDE_DIR NAMES freerdp/freerdp.h
          HINTS ${PC_FREERDP_INCLUDEDIR} ${PC_FREERDP_INCLUDE_DIRS})

find_path(WINPR_INCLUDE_DIR NAMES winpr/winpr.h
          HINTS ${PC_FREERDP_INCLUDEDIR} ${PC_FREERDP_INCLUDE_DIRS})

find_library(FREERDP_LIBRARY NAMES freerdp2
             HINTS ${PC_FREERDP_LIBDIR} ${PC_FREERDP_LIBRARY_DIRS})

find_library(WINPR_LIBRARY NAMES winpr2
             HINTS ${PC_FREERDP_LIBDIR} ${PC_FREERDP_LIBRARY_DIRS})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(FREERDP DEFAULT_MSG FREERDP_LIBRARY FREERDP_INCLUDE_DIR)

set(FREERDP_LIBRARIES ${FREERDP_LIBRARY} ${WINPR_LIBRARY})
set(FREERDP_INCLUDE_DIRS ${FREERDP_INCLUDE_DIR} ${WINPR_INCLUDE_DIR})

mark_as_advanced(FREERDP_INCLUDE_DIR FREERDP_LIBRARY)
