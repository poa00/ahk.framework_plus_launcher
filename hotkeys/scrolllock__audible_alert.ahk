;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Simpler Audible Alert for ScrollLock
;;
*~ScrollLock::
	_state := ( GetKeyState( "ScrollLock", "T" ) ) ? "On":"Off"
	SoundPlay, %A_WinDir%\Media\Speech %_state%.wav

	;; Prevent spam...
	KeyWait, ScrollLock
return


;;
;; Simple Audible Alert for ScrollLock
;;
; *ScrollLock::
	; _state := ( GetKeyState( "ScrollLock", "T" ) ) ? "On":"Off"
	; SetScrollLockState, %_state%
	; SoundPlay, %A_WinDir%\Media\Speech %_state%.wav

	; Prevent spam...
	; KeyWait, ScrollLock
; return


;;
;; Leaving this logic in in case you want to use a different bit of audio...
;;
; *ScrollLock::
	; if ( !GetKeyState( "ScrollLock", "T" ) )
	; {
		; SetScrollLockState, on
		; SoundPlay, %A_WinDir%\Media\Speech On.wav
	; }
	; else
	; {
		; SetScrollLockState, off
		; SoundPlay, %A_WinDir%\Media\Speech Off.wav
	; }
; return