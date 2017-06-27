# A lame attempt at building the Soundflower KEXT via CMake
# Written By Sheldon Thomas
cmake_minimum_required (VERSION 3.8.2)
PROJECT("SoundFlower")
set(KEXT_TARGET_NAME SoundflowerKext)
set(SOUNDFLOWER_KERNEL
    source/SoundflowerDevice.cpp
    source/SoundflowerEngine.cpp
)

#MACOSX_BUNDLE
# add_executable(
#     ${KEXT_TARGET_NAME}
#     ${SOUNDFLOWER_KERNEL}
# )

add_library(
    ${KEXT_TARGET_NAME} MODULE
    ${SOUNDFLOWER_KERNEL}
)

set(driver_name "Soundflower")
set(driver_id "com.soundflower.kext")
set(driver_version "1.0.0")

set_target_properties(${KEXT_TARGET_NAME} PROPERTIES
    BUNDLE YES
    BUNDLE_EXTENSION "kext"
    INSTALL_RPATH "" # rpath must not be set! # https://cmake.org/pipermail/cmake/2017-January/064846.html
    MACOSX_BUNDLE TRUE
    CLANG_CXX_LANGUAGE_STANDARD "c++0x"
    CLANG_CXX_LIBRARY "libc++"
    MODULE_NAME "com.foo.foobar"
    GCC_ENABLE_KERNEL_DEVELOPMENT 1
    MACOSX_BUNDLE_BUNDLE_NAME ${driver_name}
    MACOSX_BUNDLE_BUNDLE_VERSION ${driver_version}
    MACOSX_BUNDLE_GUI_IDENTIFIER ${driver_id}    
    MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_LIST_DIR}/Source/Info.plist
    OUTPUT_NAME ${driver_name}
    XCODE_ATTRIBUTE_MODULE_NAME ${driver_id}
    XCODE_ATTRIBUTE_MODULE_VERSION ${driver_version}
    XCODE_PRODUCT_TYPE "com.apple.product-type.kernel-extension.iokit"
    # FRAMEWORK_VERSION A
    # MACOSX_FRAMEWORK_IDENTIFIER ${FRAMEWORK_BUNDLE_IDENTIFIER}
    # MACOSX_FRAMEWORK_INFO_PLIST ${CMAKE_CURRENT_LIST_DIR}/Source/Info.plist
    # "current version" in semantic format in Mach-O binary file
    # VERSION 1.0.0
    # "compatibility version" in semantic format in Mach-O binary file
    # SOVERSION 1.0.0
    # PUBLIC_HEADER "${CMAKE_CURRENT_LIST_DIR}/Foo.hh"
    # XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CODE_SIGN_IDENTITY}
    # XCODE_ATTRIBUTE_SKIP_INSTALL "YES"
)

