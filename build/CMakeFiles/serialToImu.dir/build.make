# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chiao/documents/serialToImu

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chiao/documents/serialToImu/build

# Include any dependencies generated for this target.
include CMakeFiles/serialToImu.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/serialToImu.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/serialToImu.dir/flags.make

CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o: CMakeFiles/serialToImu.dir/flags.make
CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o: ../src/serialToImu.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/chiao/documents/serialToImu/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o -c /home/chiao/documents/serialToImu/src/serialToImu.cpp

CMakeFiles/serialToImu.dir/src/serialToImu.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serialToImu.dir/src/serialToImu.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/chiao/documents/serialToImu/src/serialToImu.cpp > CMakeFiles/serialToImu.dir/src/serialToImu.cpp.i

CMakeFiles/serialToImu.dir/src/serialToImu.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serialToImu.dir/src/serialToImu.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/chiao/documents/serialToImu/src/serialToImu.cpp -o CMakeFiles/serialToImu.dir/src/serialToImu.cpp.s

CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.requires:
.PHONY : CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.requires

CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.provides: CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.requires
	$(MAKE) -f CMakeFiles/serialToImu.dir/build.make CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.provides.build
.PHONY : CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.provides

CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.provides.build: CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o

# Object files for target serialToImu
serialToImu_OBJECTS = \
"CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o"

# External object files for target serialToImu
serialToImu_EXTERNAL_OBJECTS =

serialToImu: CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o
serialToImu: CMakeFiles/serialToImu.dir/build.make
serialToImu: CMakeFiles/serialToImu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable serialToImu"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serialToImu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/serialToImu.dir/build: serialToImu
.PHONY : CMakeFiles/serialToImu.dir/build

CMakeFiles/serialToImu.dir/requires: CMakeFiles/serialToImu.dir/src/serialToImu.cpp.o.requires
.PHONY : CMakeFiles/serialToImu.dir/requires

CMakeFiles/serialToImu.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/serialToImu.dir/cmake_clean.cmake
.PHONY : CMakeFiles/serialToImu.dir/clean

CMakeFiles/serialToImu.dir/depend:
	cd /home/chiao/documents/serialToImu/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chiao/documents/serialToImu /home/chiao/documents/serialToImu /home/chiao/documents/serialToImu/build /home/chiao/documents/serialToImu/build /home/chiao/documents/serialToImu/build/CMakeFiles/serialToImu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/serialToImu.dir/depend

