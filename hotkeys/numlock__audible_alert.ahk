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
;; Simple Audible Alert for NumLock
;;
; *NumLock::
	; _state := ( GetKeyState( "NumLock", "T" ) ) ? "On":"Off"
	; SetNumLockState, %_state%
	; SoundPlay, %A_WinDir%\Media\Speech %_state%.wav

	; Prevent spam...
	; KeyWait, NumLock
; return


;;
;; Leaving this logic in in case you want to use a different bit of audio...
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