
void setup() {

}

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


