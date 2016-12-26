;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; OnInit - setup config default so user can set their dropbox id without editing scripts...
;;
OnInit_hotkey_screencapture_current_window__alt_f12( )
{
	configuration.SetDefaultValue( "Cloud", "DropBox_UserID", 12345678 )
	configuration.SetDefaultValue( "Cloud", "PrivateScreenshotsPath", A_AppData . "\..\..\Dropbox\Screenshots\" )
	configuration.SetDefaultValue( "Cloud", "PublicScreenshotsPath", A_AppData . "\..\..\Dropbox\Public\Screenshots\" )

	;; Todo: Create folders if not exists
	; fileio.CreateFolder( configuration.ReadValue( "Cloud", "PrivateScreenshotsPath" ) )
	; fileio.CreateFolder( configuration.ReadValue( "Cloud", "PublicScreenshotsPath" ) )
}


;;
;; [Alt]+[F12] Screencapture of current window...
;;
!F12::
	run, AutoHotkey "processes\process_screenshot_win_and_notification.ahk"
return