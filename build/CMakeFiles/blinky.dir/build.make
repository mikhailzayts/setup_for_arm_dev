# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\mihai\Desktop\setup_for_arm_dev

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\mihai\Desktop\setup_for_arm_dev\build

# Include any dependencies generated for this target.
include CMakeFiles/blinky.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/blinky.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/blinky.dir/flags.make

CMakeFiles/blinky.dir/sources/application/main.c.o: CMakeFiles/blinky.dir/flags.make
CMakeFiles/blinky.dir/sources/application/main.c.o: ../sources/application/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\mihai\Desktop\setup_for_arm_dev\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/blinky.dir/sources/application/main.c.o"
	C:\PROGRA~2\GNUARM~1\92020-~1\bin\AR19DD~1.EXE --sysroot="C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin/../arm-none-eabi" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\blinky.dir\sources\application\main.c.o -c C:\Users\mihai\Desktop\setup_for_arm_dev\sources\application\main.c

CMakeFiles/blinky.dir/sources/application/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/blinky.dir/sources/application/main.c.i"
	C:\PROGRA~2\GNUARM~1\92020-~1\bin\AR19DD~1.EXE --sysroot="C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin/../arm-none-eabi" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\mihai\Desktop\setup_for_arm_dev\sources\application\main.c > CMakeFiles\blinky.dir\sources\application\main.c.i

CMakeFiles/blinky.dir/sources/application/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/blinky.dir/sources/application/main.c.s"
	C:\PROGRA~2\GNUARM~1\92020-~1\bin\AR19DD~1.EXE --sysroot="C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin/../arm-none-eabi" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\mihai\Desktop\setup_for_arm_dev\sources\application\main.c -o CMakeFiles\blinky.dir\sources\application\main.c.s

CMakeFiles/blinky.dir/sources/hardware/gcc_startup_nrf52.S.o: CMakeFiles/blinky.dir/flags.make
CMakeFiles/blinky.dir/sources/hardware/gcc_startup_nrf52.S.o: ../sources/hardware/gcc_startup_nrf52.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\mihai\Desktop\setup_for_arm_dev\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building ASM object CMakeFiles/blinky.dir/sources/hardware/gcc_startup_nrf52.S.o"
	C:\PROGRA~2\GNUARM~1\92020-~1\bin\AR19DD~1.EXE --sysroot="C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin/../arm-none-eabi" $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles\blinky.dir\sources\hardware\gcc_startup_nrf52.S.o -c C:\Users\mihai\Desktop\setup_for_arm_dev\sources\hardware\gcc_startup_nrf52.S

# Object files for target blinky
blinky_OBJECTS = \
"CMakeFiles/blinky.dir/sources/application/main.c.o" \
"CMakeFiles/blinky.dir/sources/hardware/gcc_startup_nrf52.S.o"

# External object files for target blinky
blinky_EXTERNAL_OBJECTS =

blinky.elf: CMakeFiles/blinky.dir/sources/application/main.c.o
blinky.elf: CMakeFiles/blinky.dir/sources/hardware/gcc_startup_nrf52.S.o
blinky.elf: CMakeFiles/blinky.dir/build.make
blinky.elf: CMakeFiles/blinky.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\mihai\Desktop\setup_for_arm_dev\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable blinky.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\blinky.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/blinky.dir/build: blinky.elf

.PHONY : CMakeFiles/blinky.dir/build

CMakeFiles/blinky.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\blinky.dir\cmake_clean.cmake
.PHONY : CMakeFiles/blinky.dir/clean

CMakeFiles/blinky.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\mihai\Desktop\setup_for_arm_dev C:\Users\mihai\Desktop\setup_for_arm_dev C:\Users\mihai\Desktop\setup_for_arm_dev\build C:\Users\mihai\Desktop\setup_for_arm_dev\build C:\Users\mihai\Desktop\setup_for_arm_dev\build\CMakeFiles\blinky.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/blinky.dir/depend

