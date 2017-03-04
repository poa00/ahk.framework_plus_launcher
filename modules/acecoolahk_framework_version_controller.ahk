;;
;; Internal File - This file handles basic versioning of the framework and makes important calls which controls the auto-updater and changelog systems - Josh 'Acecool' Moser
;;


;;
;; Variables, CONSTants, ENUMerations, etc..
;;



;;
;; Script Config
;;
OnInit_acecoolahk_framework_version_controller( )
{
	;; Remove the old version...
	config.Delete( "acecoolahk_framework", "version", "0.0.0" )

	;; Version Code Format: <Major>.<Minor>.<Build_or_Negligible>
	config.SetDefault( "__Versioning", "version", "0.0.0" )
	config.SetComment( "__Versioning", "version", "Version Code Format: <Major>.<Minor>.<Build_or_Negligible> - this version is the last version executed!" )

	;;
	config.SetDefault( "__Versioning", "changelog_version_read", "0.0.0" )
	config.SetComment( "__Versioning", "changelog_version_read", "The last ChangeLog version information you have read..." )

	;; Get the current framework version from version.txt
	_version := version.GetFile( )
	_last_version := version.GetConfig( )
	_last_changelog_version := version.GetLastChangelogConfig( )
	_live_version := "x.x.x" ;;version.GetRepo( )

	debug.printx( "Local version.txt is " . _version )
	debug.printx( "Config __Versioning version is " . _last_version )
	debug.printx( "Config __Versioning last_changelog_version is " . _last_changelog_version )
	debug.printx( "Repo version.txt is " . _live_version )

	;; If we performed an update and version.txt differs from config.ini - launch ChangeLog
	if ( _version != _last_version || _version != _last_changelog_version )
	{
		version.SetConfig( _version )
		util.RunFuncIfExists( "OnCall_acecoolahk_framework_changelog_dialog" )
	}

	;; If a newer version is available online because version.txt differs from repo://version.txt then launch - auto update
	if ( _version != _live_version )
	{
		util.RunFuncIfExists( "OnCall_acecoolahk_framework_auto_update_dialog" )
	}
}