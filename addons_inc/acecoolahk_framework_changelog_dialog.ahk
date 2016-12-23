;;
;; ChangeLog Dialog Window - Opens Once Per Version - Josh 'Acecool' Moser
;;


;;
;; Declaration
;;
; global ChangeLogConfig

;; Read the version
FileRead, _version, version.txt

;;
;; Config - Set up default values ( Not the current value so first-run will open the dialog )...
;; Addons are included differently ( before hotkeys ) so there are no blocking calls yet ( there shouldn't be ) and our default config can stay here...
;;
OnInit_acecoolahk_framework_changelog_dialog( )
{
	configuration.SetDefaultValue( "AcecoolAHK_Framework", "version_ran", "0.0.0" )
}


;;
;; Determine whether or not to open the changelog dialog window...
;;
_last_changelog_displayed:=configuration.ReadValue( "AcecoolAHK_Framework", "version_ran" )
if ( _version != _last_changelog_displayed )
{
	;; Update the version in the file so the script knows the last-version executed...
	configuration.SetValue( "AcecoolAHK_Framework", "version_ran", _version )

	;; Open up a dialog window and explain the differences...
	MsgBox, You're running a new version ( %_version% - upgraded from %_last_changelog_displayed% ) of AcecoolAHK_Framework! This will be a changelog dialog window soon with the option to never open it again ( via checkbox on the window which will update config.ini - but I recommend allowing it to open as it only opens once per new-version installed )
}




;MsgBox This AcecoolAHK_Framework is meant to be running 24/7 ( for your hotkeys, right? ) therefore initial launch should occur through the framework_launcher ie AutoHotkey.ahk or AutoHotkey.exe - The run_framework_base/full.ahk files are not meant to be executed standalone ( they do not generate the files necessary to run but they can be executed after the first launch but if new files are added then they will not be detected until the launcher generates the files )... I will look into ensuring everything is generated when running those files but it may not be possible - ie if I have one of the run_framework_*.ahk files generate the files using any means and in the same instance use #include *s xxx.ahk.. if the file didn't exist before then nothing will be included, so it will always be 1 load behind in terms of running updated scripts so you'd need to run it twice every update you make to the list of files which isn't fun... I am working on a solution so this won't happen ( In short.. It doesn't happen with the current set up; but it would happen if I didn't do it the way I am doing it )