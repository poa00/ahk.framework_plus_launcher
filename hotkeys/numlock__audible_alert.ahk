;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Simpler Audible Alert for NumLock
;;
*~NumLock::
	_state := ( GetKeyState( "NumLock", "T" ) ) ? "On":"Off"
	SoundPlay, %A_WinDir%\Media\Speech %_state%.wav

	;; Prevent spam...
	KeyWait, NumLock
return


;;
;; Simple Audible Alert for NumLock using Ternary Operation to switch between On and Off ( as Audio has it in the title )
;; You could just as easily specify a full-audio path in place of On or Off, or use different text for the toggle-states, etc..
;;
; *NumLock::
	; _state := ( GetKeyState( "NumLock", "T" ) ) ? "On":"Off"
	; SetNumLockState, %_state%
	; SoundPlay, %A_WinDir%\Media\Speech %_state%.wav

	; Prevent spam...
	; KeyWait, NumLock
; return


;;
;; Leaving this logic in in case you want to use different audio files which don't contain On / Off in the title and if you prefer if conditions..
;;
; *NumLock::
	; if ( !GetKeyState( "NumLock", "T" ) )
	; {
		; SetNumLockState, on
		; SoundPlay, %A_WinDir%\Media\Speech On.wav
	; }
	; else
	; {
		; SetNumLockState, off
		; SoundPlay, %A_WinDir%\Media\Speech Off.wav
	; }
; return