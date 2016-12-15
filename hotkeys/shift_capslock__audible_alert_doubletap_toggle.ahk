;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Shift can be used to disengage CapsLock if enabled..
;;
*$Shift::
	; If caps is engaged, disable it...
	if ( GetKeyState( "CapsLock", "T" ) )
	{
		SetCapsLockState, off
		SoundPlay, %A_WinDir%\Media\Speech Off.wav
	}
	else
	{
		;; Capslock needs to be turned on if double-tapped ( 150 ms is a really quick double-tap time; I did this to keep it harder to activate )
		if ( A_PriorHotkey = "*$Shift" ) && ( A_TimeSincePriorHotkey < 150 )
		{
			SetCapsLockState, on
			SoundPlay, %A_WinDir%\Media\Speech On.wav
		}
	}
return