
#include "Platform.h"
#include "USBAPI.h"
#include "USBDesc.h"

#if defined(USBCON)
#ifdef MIDI_ENABLED

#define WEAK __attribute__ ((weak))

#define CLASS_AUDIO 0x01
#define SUBCLASS_AUDIO_CONTROL 0x01
#define SUBCLASS_MIDISTREAMING 0x03

#define TYPE_CS_INTERFACE 0x24
#define SUBTYPE_HEADER 0x01
#define SUBTYPE_MIDI_IN_JACK 0x02
#define SUBTYPE_MIDI_OUT_JACK 0x03
#define JACK_EMBEDDED 0x01
#define JACK_EXTERNAL 0x02

#define JACK1 0x01
#define JACK2 0x02
#define JACK3 0x03
#define JACK4 0x04

extern const ACDescriptor _acInterface PROGMEM;
const ACDescriptor _acInterface =
{
	D_INTERFACE(AC_INTERFACE,0,CLASS_AUDIO,SUBCLASS_AUDIO_CONTROL,0),
	{9, TYPE_CS_INTERFACE, SUBTYPE_HEADER, 0x0100, 9, 0x01, MIDI_INTERFACE}
};

int WEAK AC_GetInterface(u8* interfaceNum)
{
	interfaceNum[0] += 1;	// uses 1
	return USB_SendControl(TRANSFER_PGM,&_acInterface,sizeof(_acInterface));
}

extern const MIDIDescriptor _midiInterface PROGMEM;
const MIDIDescriptor _midiInterface =
{
	D_INTERFACE(MIDI_INTERFACE,MIDI_ENDPOINT_COUNT,CLASS_AUDIO,SUBCLASS_MIDISTREAMING,0),
	{7, TYPE_CS_INTERFACE, SUBTYPE_HEADER, 0x0100, 34},
	{6, TYPE_CS_INTERFACE, SUBTYPE_MIDI_IN_JACK, JACK_EMBEDDED, JACK1, 0x00},
	{9, TYPE_CS_INTERFACE, SUBTYPE_MIDI_OUT_JACK, JACK_EMBEDDED, JACK2, 1, JACK3, 1, 0x00},
    {6, TYPE_CS_INTERFACE, SUBTYPE_MIDI_IN_JACK, JACK_EXTERNAL, JACK3, 0x00},
    {9, TYPE_CS_INTERFACE, SUBTYPE_MIDI_OUT_JACK, JACK_EXTERNAL, JACK4, 1, JACK1, 1, 0x00},
    {
        D_ENDPOINT(USB_ENDPOINT_OUT(MIDI_ENDPOINT_OUT), USB_ENDPOINT_TYPE_BULK, 0x0040, 0x00),
        { 5, 0x25, 0x01, 0x01, JACK1 }
    },
    { 
        D_ENDPOINT(USB_ENDPOINT_IN(MIDI_ENDPOINT_IN), USB_ENDPOINT_TYPE_BULK, 0x0040, 0x00),
        { 5, 0x25, 0x01, 0x01, JACK2 }
    }
};


int WEAK MIDI_GetInterface(u8* interfaceNum)
{
	interfaceNum[0] += 1;	// uses 1
	return USB_SendControl(TRANSFER_PGM,&_midiInterface,sizeof(_midiInterface));
}

bool WEAK MIDI_Setup(Setup& setup)
{
    u8 r = setup.bRequest;
    u8 requestType = setup.bmRequestType;
    
    return false;
}

#endif
#endif
