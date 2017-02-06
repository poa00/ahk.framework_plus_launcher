
;;
;; Audible Alerts for NumLock, ScrollLock and CapsLock + Shift Double-Tap Toggle - Josh 'Acecool' Moser
;;


;;
;; Declarations
;;
OnInit_audible_alerts_numlock_scrolllock_capslock_plus_shift_doubletap_toggle( )
{
	config.SetDefault( "DoubleTapSpeeds", "ToggleCapsLockViaShift", 150 )
	config.SetDefault( "AudibleAlerts", "NUMLOCK_ON", A_WinDir "\Media\Speech On.wav" )
	config.SetDefault( "AudibleAlerts", "NUMLOCK_OFF", A_WinDir "\Media\Speech Off.wav" )
	config.SetDefault( "AudibleAlerts", "SCROLLLOCK_ON", A_WinDir "\Media\Speech On.wav" )
	config.SetDefault( "AudibleAlerts", "SCROLLLOCK_OFF", A_WinDir "\Media\Speech Off.wav" )
	config.SetDefault( "AudibleAlerts", "CAPSLOCK_ON", A_WinDir "\Media\Speech On.wav" )
	config.SetDefault( "AudibleAlerts", "CAPSLOCK_OFF", A_WinDir "\Media\Speech Off.wav" )
}


;;
;; Helper function to reduce code...
;;
AudibleAlertPlay( _name, _alert_on, _alert_off, _force_mode = false )
{
	;; If force_mode is set then use that audio-key instead... otherwise Grab the logical state of the key to switch between which audio file we play...
	_state := ( _force_mode ) ? _force_mode : ( ( GetKeyState( _name, "T" ) ) ? _alert_on : _alert_off )

	;; Read the key from the config file ( microcaching is a must as fileio is expensive )
	_sound := config.Get( "AudibleAlerts", _state )

	;; Simple debugging to notify what is being received...
	debug.print( "[ AudibleAlertPlay ] [ " . _name . " ] " . _state . " = " . _sound )

	;; Play the sound..
	SoundPlay, %_sound%

	;; Prevent spam by waiting to do anything until the key is released...
	;; If anyone knows a better way.. ie to trigger this once per key-press let me know...
	;; Doesn't seem to work...
	KeyWait, %_name%
}


;;
;; Audible Alert for NumLock with Configuration System Built-In
;; TODO: Set up Configuration System to micro-cache the data to prevent needing to read from file every time...
;;
*~NumLock::
	AudibleAlertPlay( "NumLock", "NUMLOCK_ON", "NUMLOCK_OFF" )
return


;;
;; Audible Alert for ScrollLock with Configuration System Built-In
;; TODO: Set up Configuration System to micro-cache the data to prevent needing to read from file every time...
;;
*~ScrollLock::
	AudibleAlertPlay( "ScrollLock", "SCROLLLOCK_ON", "SCROLLLOCK_OFF" )
return


;;
;; Shift can be used to disengage CapsLock if enabled..
;;
; *$Shift::
	;; If caps is engaged, disable it...
	; if ( GetKeyState( "CapsLock", "T" ) )
	; {
		;; Disable CapsLock
		; SetCapsLockState, off

		;; Force play the CapsLock Off Audio File...
		; AudibleAlertPlay( "CapsLock", "CAPSLOCK_ON", "CAPSLOCK_OFF", "CAPSLOCK_OFF" )
	; }
	; else
	; {
		;; Read the value ( Will microcache later to prevent reading each time... ) and convert value to number...
		; _delay := config.Get( "DoubleTapSpeeds", "ToggleCapsLockViaShift" )
		; _delay += 0

		;; Capslock needs to be turned on if double-tapped ( 150 ms is a really quick double-tap time; I did this to keep it harder to activate )
		; if ( A_PriorHotkey = "*$Shift" ) && ( A_TimeSincePriorHotkey < _delay )
		; {
			;; Enable CapsLock
			; SetCapsLockState, on

			;; Force play the CapsLock On Audio File...
			; AudibleAlertPlay( "CapsLock", "CAPSLOCK_ON", "CAPSLOCK_OFF", "CAPSLOCK_ON" )
		; }
	; }
; return