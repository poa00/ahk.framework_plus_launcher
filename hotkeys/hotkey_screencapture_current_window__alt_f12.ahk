;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; OnInit - setup config default so user can set their dropbox id without editing scripts...
;;
OnInit_hotkey_screencapture_current_window__alt_f12( )
{
	configuration.SetDefaultValue( "Cloud", "DropBox_UserID", 12345678 )
}


;;
;; [Alt]+[F12] Screencapture of current window...
;;
!F12::
	run, AutoHotkey "processes\process_screenshot_win_&_notification.ahk"
return