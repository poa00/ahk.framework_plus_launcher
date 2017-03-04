;;
;; ChangeLog Dialog Window - Opens Once Per Version - Josh 'Acecool' Moser
;;


;;
;; Declaration
;;


;;
;; In case the user kept this but deleted changelog dialog file
;;
OnInit_acecoolahk_framework_auto_update_dialog( )
{
	;; Should the user be notified when there is a new version available online?
	config.SetDefault( "__AutoUpdater", "display_update_available", true )

	;; How often should we check for updates... -1 every start-up, 0 is never, > 0 is in hours or days or seconds?
	config.SetDefault( "__AutoUpdater", "update_check_frequency", -1 )


}


;;
;; Config - Set up default values ( Not the current value so first-run will open the dialog )...
;; Addons are included differently ( before hotkeys ) so there are no blocking calls yet ( there shouldn't be ) and our default config can stay here...
;;
OnCall_acecoolahk_framework_auto_update_dialog( )
{
	if ( !debug.DeveloperMode( ) )
		return

	;; Get the current framework version from version.txt
	_version := version.GetFile( )
	_last_version := version.GetConfig( )
	_last_changelog_version := version.GetLastChangelogConfig( )
	_live_version := "x.x.x" ;;version.GetRepo( )

	notify.MsgBox( "You're running version ( " . _version . " ). Another version is available online ( " . _live_version . " )!" )
}


;MsgBox This AcecoolAHK_Framework is meant to be running 24/7 ( for your hotkeys, right? ) therefore initial launch should occur through the framework_launcher ie AutoHotkey.ahk or AutoHotkey.exe - The run_framework_base/full.ahk files are not meant to be executed standalone ( they do not generate the files necessary to run but they can be executed after the first launch but if new files are added then they will not be detected until the launcher generates the files )... I will look into ensuring everything is generated when running those files but it may not be possible - ie if I have one of the run_framework_*.ahk files generate the files using any means and in the same instance use #include *s xxx.ahk.. if the file didn't exist before then nothing will be included, so it will always be 1 load behind in terms of running updated scripts so you'd need to run it twice every update you make to the list of files which isn't fun... I am working on a solution so this won't happen ( In short.. It doesn't happen with the current set up; but it would happen if I didn't do it the way I am doing it )