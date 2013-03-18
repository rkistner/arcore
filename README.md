# Arduino hardware cores

This is a fork of the core Arduino core hardware libraries.

The goal is to have a simple base to customize the core libraries to add or modify core functionality, without
needing to clone the entire Arduino repository.

Version 1.5.x of the Arduino IDE is required to build projects with this library.

## Installation and Usage

1. Clone this repository.
2. On Linux, run `./install.sh`. The script creates a symlink in ~/Arduino/hardware to the repository. On Windows or Mac you have
   to do this manually (you may move the repository there instead of creating a symlink).
3. Launch the Arduino IDE (only tested on 1.5.2, will not work pre-1.5.x).
4. Under Tools -> Board, select Arduino Leonardo (arcore).
5. Upload your sketch as usual.

## MIDI-USB support

This fork currently contains a basic version of USB-MIDI support. It it still under development, and the API should be considered unstable.

The implementation currently has a single IN and a single OUT endpoint. It can be used together with CDC and HID (as a composite USB device),
 or standalone (by modifying USBDesc.h).

A simple example that echoes MIDI messages back to the PC:

    void loop() {
        while(MIDIUSB.available() > 0) {
            MIDIEvent e;
            e = MIDIUSB.read();
            MIDIUSB.write(e);
            MIDIUSB.flush();
            // Example messages:
            // Note on, channel 0, middle C (48), normal velocity (64):
            // e = {0x09, 0x90, 48, 64}
            // Note off, channel 2, middle C, fastest velocity (127):
            // e = {0x08, 0x82, 48, 127}
        }
    }

Currently there are no high-level API's. However, the MIDI event format is very simple to read and write.
For more info on the MIDI-USB event format, see the official [USB-MIDI specification][2].


## Other boards

Supporting more boards should be as simple as copying the configuration over from the official boards.txt to the one in this repository,
 with minor changes to build.core and build.variant. However, I only have an Arduino Leonardo myself, so I cannot test and support any
 other boards myself.

ARM (sam) boards might require more work.


 [1]: https://github.com/arduino/Arduino/tree/ide-1.5.x/hardware/arduino/avr/cores
 [2]: http://www.usb.org/developers/devclass_docs/midi10.pdf
