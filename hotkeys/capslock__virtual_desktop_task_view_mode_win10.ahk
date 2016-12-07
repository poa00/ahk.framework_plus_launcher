;;
;; Turns CapsLock into a useful button - Windows 10 Virtual Desktop Task-View HotKey - Josh 'Acecool' Moser
;;


;;
;; CapsLock OnRelease Hook - Capslock now works like Win + Tab..
;; Force CapsLock off if you want: SetCapsLockState, off
;; { Blind } Spaces in any of these seems to cause the button to stick...
;;
*CapsLock UP::
	Send {Blind}{LWin UP}
return


;;
;; CapsLock OnPress Hook - Capslock now works like Win + Tab..
;; Force CapsLock off if you want: SetCapsLockState, off
;; { Blind } Spaces in any of these seems to cause the button to stick...
;;
*CapsLock::
	Send {Blind}{CapsLock UP}{LWin DOWN}{Tab}
return