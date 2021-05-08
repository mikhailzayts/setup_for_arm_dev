cmake_minimum_required(VERSION 3.19)

project(blinky ASM C)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# GCC ARM toolchain options
set(CPU_FLAGS -mthumb -mcpu=cortex-m4 -mfloat-abi=soft)
set(GCC_FLAGS -ffunction-sections -fdata-sections -fmessage-length=0 -fsigned-char -fshort-enums -ffunction-sections -std=gnu11 -Wno-pedantic -o0)
add_compile_options(${CPU_FLAGS} ${GCC_FLAGS})

# Set up linker script
set(NRF52_LD_SCRIPT ${CMAKE_SOURCE_DIR}/nrf52840.ld)
add_link_options(${CPU_FLAGS} --specs=nosys.specs -Xlinker --gc-sections)
add_link_options(-T ${NRF52_LD_SCRIPT})
add_link_options(-L ${CMAKE_SOURCE_DIR})

add_executable(${PROJECT_NAME} sources/application/main.c sources/hardware/gcc_startup_nrf52.S)
#firmware_size(${PROJECT_NAME})
#generate_object(${PROJECT_NAME} .hex ihex)
#generate_object(${PROJECT_NAME} .bin binary)
