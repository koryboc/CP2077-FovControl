set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR AMD64)

set(XWIN_ROOT "$ENV{HOME}/.xwin")

set(CMAKE_C_COMPILER   clang-cl)
set(CMAKE_CXX_COMPILER clang-cl)
set(CMAKE_LINKER       lld-link)
set(CMAKE_AR           llvm-lib)
set(CMAKE_MT           llvm-mt)
set(CMAKE_RC_COMPILER  llvm-rc)

set(CMAKE_C_FLAGS_INIT   "--target=x86_64-pc-windows-msvc")
set(CMAKE_CXX_FLAGS_INIT "--target=x86_64-pc-windows-msvc")

set(_XWIN_LINK "/manifest:no \
-libpath:${XWIN_ROOT}/crt/lib/x86_64 \
-libpath:${XWIN_ROOT}/sdk/lib/um/x86_64 \
-libpath:${XWIN_ROOT}/sdk/lib/ucrt/x86_64")

set(CMAKE_EXE_LINKER_FLAGS_INIT    "${_XWIN_LINK}")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${_XWIN_LINK}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${_XWIN_LINK}")

set(_XWIN_INCLUDE_DIRS
    ${XWIN_ROOT}/crt/include
    ${XWIN_ROOT}/sdk/include/ucrt
    ${XWIN_ROOT}/sdk/include/um
    ${XWIN_ROOT}/sdk/include/shared
    ${XWIN_ROOT}/sdk/include/winrt
    ${XWIN_ROOT}/sdk/include/cppwinrt)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES   "${_XWIN_INCLUDE_DIRS}")
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES "${_XWIN_INCLUDE_DIRS}")
set(CMAKE_RC_STANDARD_INCLUDE_DIRECTORIES  "${_XWIN_INCLUDE_DIRS}")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
