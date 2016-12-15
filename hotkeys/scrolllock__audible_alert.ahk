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
;; Simple Audible Alert for ScrollLock using Ternary Operation to switch between On and Off ( as Audio has it in the title )
;; You could just as easily specify a full-audio path in place of On or Off, or use different text for the toggle-states, etc..
;;
; *ScrollLock::
	; _state := ( GetKeyState( "ScrollLock", "T" ) ) ? "On":"Off"
	; SetScrollLockState, %_state%
	; SoundPlay, %A_WinDir%\Media\Speech %_state%.wav

	; Prevent spam...
	; KeyWait, ScrollLock
; return


;;
;; Leaving this logic in in case you want to use different audio files which don't contain On / Off in the title and if you prefer if conditions..
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