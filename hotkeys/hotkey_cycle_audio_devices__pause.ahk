;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; OnInit / Configuration / Script Setup...
;;
OnInit_hotkey_cycle_audio_devices_pause( )
{
	;; When the device is cycled.. play a sound ( Default is Asterisk ) - set to nothing in config.ini to prevent playing the sound...
	config.SetDefault( "AudioDeviceCycler", "OnSwitchSound", "*64" )

	;; Should we use TextToSpeech to notify the user of the currently active device?
	config.SetDefault( "AudioDeviceCycler", "OnSwitchTextToSpeech", "yes" )

	;; Default Values - Currently Selected Device, Number of Devices
	config.SetDefault( "AudioDeviceCycler", "Selected", 0 )
	config.SetDefault( "AudioDeviceCycler", "Devices", 2 )

	;; Default Values for Device 1 ( starts at 0 ) - This name is what is under Windows "Sound" panel / Playback and Recording Devices ( from
	;;	Tray Audio Icon - Right click audio device in list > Properties > Set the name [ highlighted by default ] above Change Icon )
	config.SetDefault( "AudioDeviceCycler", "Out_0", "Speakers" )
	config.SetDefault( "AudioDeviceCycler", "Mic_0", "Microphone" )
	config.SetDefault( "AudioDeviceCycler", "Out_1", "Headset" )
	config.SetDefault( "AudioDeviceCycler", "Mic_1", "Headset Microphone" )
}


;;
;; Simple Helper function ( So we can add Tray Support to directly switch between devices )
;; Note: Uses numerical index - may need to use string later on...
;;
AudioCycler_SetAudioDevices( _current:=0 )
{
	;; Read the setting into memory, if it exists...
	_audio_out := config.Get( "AudioDeviceCycler", "Out_" . _current )
	_audio_in := config.Get( "AudioDeviceCycler", "Mic_" . _current )

	;; Set the defaults - in case of an issue...
	_selected_out = Unspecified
	_selected_in = Unspecified

	;; If audio device key exists, switch to it...
	if ( _audio_out != "KEY_NOT_FOUND" )
	{
		_selected_out := _audio_out
		_selected_in := _audio_in
	}

	;; Read the key from the config file ( microcaching is a must as fileio is expensive )
	_sound := config.Get( "AudioDeviceCycler", "OnSwitchSound" )
	if ( _sound != "KEY_NOT_FOUND" && _sound != "" && _sound != "no" && _sound != "false" ) ;; CYCLE_AUDIO_DEVICES_CURRENT = 0
	{
		;; Play the sound..
		SoundPlay, %_sound%	;; Asterisk ( info )
	}

	;; Debugging
	; debug.print( "Audio Out: " . _audio_out . " / In: " . _audio_in . " / Selected: " . _selected . " / Current: " . _current . " / Count: " . _count, "", "" )

	;; show a tray tip with the new endpoint
	_text := "Audio Output: " _selected_out " and Input: " _selected_in " are now active!"
	notify.TrayTip( _text, "Audio Device Cycler", 2, 17 ) ;; 2 seconds, info icon ( 1 ) without sound ( +16 )

	;; Read the key from the config file ( microcaching is a must as fileio is expensive )
	_speech := config.Get( "AudioDeviceCycler", "OnSwitchTextToSpeech" )
	if ( _speech != "KEY_NOT_FOUND" && _speech != "" && _speech != "no" && _speech != "false" )
	{
		nircmd.TextToSpeech( _selected_out )
	}

	;; Update Input / Output
	nircmd.SetDefaultSoundDevice( _selected_out )
	nircmd.SetDefaultSoundDevice( _selected_in )
}


;;
;; Cycle through each audio device on the PC
;;
;; Note: Leaving this in as a potential option later on, but PatternHotKey was incredibly buggy when I used it.. 
;; Maybe it will work now that time has passed ( Updates )?
;;
;;	'.'	( single short press )	activates Bluetooth headset
;;	'..'	( double short press ) activates Speakers
;;	'...' ( triple short press ) activates USB headset
;; Pause::PatternHotKey( ".->ActivateSoundDeviceEndpoint( Headset )"
;;					, "..->ActivateSoundDeviceEndpoint( Speakers )" )
;;					, "...->ActivateSoundDeviceEndpoint( Logitech )" )
;;
Pause::
	;; Get the currently selected audio device
	_selected := config.Get( "AudioDeviceCycler", "Selected" )

	;; Get the number of devices we'll be using..
	_count := config.Get( "AudioDeviceCycler", "Devices" )

	;; Define our var to be set to itself or 0 if it wasn't set ( or when 0 is seen as false )...
	; CurrentSoundDevice := ( CurrentSoundDevice is digit ) ? CurrentSoundDevice : 0
	_current := mod( _selected + 1, _count )

	;; Update the configuration file of the currently selected device ( this will ensure it cycles properly and as Windows should store
	;;	the device you're using, assuming it isn't unplugged, it will be be the same if the script restarts [ I may add a call in OnInit
	;;	so this entire set-up can run on framework launch just in case it was switched.. we'll see.. ] )
	config.Set( "AudioDeviceCycler", "Selected", _current )

	;; Set the device
	AudioCycler_SetAudioDevices( _current )
return