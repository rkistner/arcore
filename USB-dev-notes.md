# USB Development Notes

Devices such as the Arduino Leonardo supports the implementation of almost any USB client device (except high speed devices probably).
Here are some notes of things I found useful while implementing MIDI-USB.

## Ubuntu

I did all my development on Ubuntu, which has some great tools for USB debugging. Here are the tools I've used:

### lsusb

`lsusb` will show you all the connected USB devices. To see the descriptors and endpoints for each device, get the device ID (manufacturer and 
product id) with `lsusb`, then use `lsusb -v -d <vid:pid>`. For example, for the Arduino Leonardo, use `lsusb -v -d 2341:8036`.

### Wireshark 

Wireshark is well known for sniffing network packets, but it can also be used for USB. To enable USB monitoring support, run `sudo modprobe usbmon`
before launching wireshark, and the USB busses will show up as monitorable devices the next time you launch Wireshark. For more details, see 
[their wiki][1].

## Development process

### Descriptors and endpoints

The first step is to get the descriptors and endpoints as they should be. Try to replicate the descriptors of an existing device, and use lsusb
to compare it with yours. If you don't have another device of the same USB type, you may find some lsusb output for a similar device on the internet.

### The send and receive implementations

Try to work off an existing implementation, such as the CDC or HID implementations by Arduino. Here Wireshark helps a lot for debugging.
Note that data is only sent to the PC if an application is connected. This means that for Serial or MIDI debugging, you need
to connect an application to the device first before you'll be able to see any data in Wireshark.

### Reset

When developing USB drivers, it is easy get the device to not respond at all, including for code upload. In this case, preset the reset button
on the board immediately after pressing upload in the Arduino IDE.

## MIDI-specific

`amidi` is useful to display raw MIDI messages coming from the device.

`aplaymidi` is useful to send MIDI data (typically midi files) to the device.

`aconnect` can be used to connect MIDI endpoints together, for example to connect the device to fsynth.


 [1]: http://wiki.wireshark.org/CaptureSetup/USB


