;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; OnInit - setup config default so user can set their dropbox id without editing scripts...
;;
OnInit_hotkey_screencapture_current_window_alt_f12( )
{
	config.SetDefault( "Cloud", "DropBox_UserID", 12345678 )
	config.SetDefault( "Cloud", "PrivateScreenshotsPath", A_AppData . "\..\..\Dropbox\Screenshots\" )
	config.SetDefault( "Cloud", "PublicScreenshotsPath", A_AppData . "\..\..\Dropbox\Public\Screenshots\" )

	;; Todo: Create folders if not exists
	; file.CreateFolder( config.Get( "Cloud", "PrivateScreenshotsPath" ) )
	; file.CreateFolder( config.Get( "Cloud", "PublicScreenshotsPath" ) )
}


;;
;; [Alt]+[F12] Screencapture of current window...
;;
!F12::
	run, AutoHotkey "processes\process_screenshot_win_and_notification.ahk"
return