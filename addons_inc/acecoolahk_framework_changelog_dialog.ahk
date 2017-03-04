;;
;; ChangeLog Dialog Window - Opens Once Per Version - Josh 'Acecool' Moser
;;


;;
;; Declaration
;;


;;
;; Config - Set up default values ( Not the current value so first-run will open the dialog )...
;; Addons are included differently ( before hotkeys ) so there are no blocking calls yet ( there shouldn't be ) and our default config can stay here...
;;
OnInit_acecoolahk_framework_changelog_dialog( )
{
	;; Setup default values controlled by this script

	;; Config value so the user can choose to never open the changelog dialog on start
	config.SetDefault( "__ChangeLog", "display_on_updated", true )
	config.SetComment( "__ChangeLog", "display_on_updated", "Set to false to prevent the changelog dialog from ever being displayed automatically when the framework has been updated - if false you can still view changelogs by using the tray-menu; true to display it when the framework has been updated!" )

	;; Set the last ChangeLog version history displayed ( so if a changelog isn't added until later, it can be displayed when it is added )
	config.SetDefault( "__ChangeLog", "version_last_reviewed", "0.0.0" )
	config.SetComment( "__ChangeLog", "version_last_reviewed", "The last version a changelog was displayed for; Used so a master-changelog can be compiled from this version to the latest version without making you click on each and every changelog link... If you want to read ALL of the changelogs from start until now, set the version value to 0.0.0 in quotes." )
}


;;
;; Determine whether or not to call changelog dialog window...
;;
; OnDetermine_acecoolahk_framework_changelog_dialog( )
; {

; }


;;
;; Called by the versioning system when the version has changed and a changelog exists for the version...
;;
OnCall_acecoolahk_framework_changelog_dialog( )
{
	if ( !debug.DeveloperMode( ) )
		return

	;; Get the current framework version from version.txt
	_version := version.GetFile( )
	_last_version := version.GetConfig( )
	_last_changelog_version := "x.x.x" ;;version.GetLastChangelogConfig( )
	_live_version := version.GetRepo( )

	if ( _version == _last_version && _version != _last_changelog_version )
		notify.MsgBox( "You're running version ( " . _version . " ). The last ChangeLog version you reviewed is (" . _last_changelog_version . " )!" )
	else
		notify.MsgBox( "You've just upgraded from version ( " . _last_version . " ) to ( " . _version . " ). The last ChangeLog version you reviewed is (" . _last_changelog_version . " )!" )
}


;MsgBox This AcecoolAHK_Framework is meant to be running 24/7 ( for your hotkeys, right? ) therefore initial launch should occur through the framework_launcher ie AutoHotkey.ahk or AutoHotkey.exe - The run_framework_base/full.ahk files are not meant to be executed standalone ( they do not generate the files necessary to run but they can be executed after the first launch but if new files are added then they will not be detected until the launcher generates the files )... I will look into ensuring everything is generated when running those files but it may not be possible - ie if I have one of the run_framework_*.ahk files generate the files using any means and in the same instance use #include *s xxx.ahk.. if the file didn't exist before then nothing will be included, so it will always be 1 load behind in terms of running updated scripts so you'd need to run it twice every update you make to the list of files which isn't fun... I am working on a solution so this won't happen ( In short.. It doesn't happen with the current set up; but it would happen if I didn't do it the way I am doing it )