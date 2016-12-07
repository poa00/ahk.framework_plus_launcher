;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Shift can be used to disengage CapsLock if enabled..
;;
*~$Shift::
	_caps:=GetKeyState( "CapsLock", "T" )
	if ( _caps )
	{
		SetCapsLockState, off
		SoundPlay, %A_WinDir%\Media\Speech Off.wav
	}

	if ( A_PriorHotkey = "*~$Shift" ) && ( A_TimeSincePriorHotkey < 175 )
	{
		if ( !_caps )
		{
			SetCapsLockState, on
			SoundPlay, %A_WinDir%\Media\Speech On.wav
		}
	}

	;; Prevent spam...
	KeyWait, Shift
return