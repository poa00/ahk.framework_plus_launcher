﻿;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; [Alt]+[F12] Screencapture of current window...
;; %A_AppData%\..\..\Dropbox\AcecoolAHK_AutoHotkey\
;;
!F12::
	run, AutoHotkey "processes\process_screenshot_win_&_notification.ahk"
return