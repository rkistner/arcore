# Arduino hardware cores

This is a fork of the core Arduino core hardware libraries.

The goal is to have a simple base to customize the core libraries to add or modify core functionality, without
needing to clone the entire Arduino repository.

Version 1.5.x of the Arduino IDE is required to build projects with this library.

## Installation and Usage

1. Clone this repository.
2. On Linux, run `./install.sh`. The script creates a symlink in ~/Arduino/hardware to the repository. On Windows or Mac you have to do this manually (you may move the repository there instead of creating a symlink).
3. Launch the Arduino IDE (only tested on 1.5.2, will not work pre-1.5.x).
4. Under Tools -> Board, select Arduino Leonardo (arcore).
5. Upload your sketch as usual.

## Other boards

Supporting more boards should be as simple as copying the configuration over from the official boards.txt to the one in this repository, with minor changes to build.core and build.variant. However, I only have an Arduino Leonardo myself, so I cannot test and support any other boards myself.

ARM (sam) boards might require more work.


 [1]: https://github.com/arduino/Arduino/tree/ide-1.5.x/hardware/arduino/avr/cores
