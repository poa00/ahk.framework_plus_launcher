;;
;; First-Launch Notification and total counter - Josh 'Acecool' Moser
;;


;;
;;
;;
OnInit_acecool_ahk_framework_launch_counter( )
{
	;; Setup default values
	config.SetDefault( "Debug", "RunTimes", 0 )

	;; Read the version
	FileRead, _version, version.txt

	;; Determine whether or not to open the changelog dialog window...
	_times := config.Get( "Debug", "RunTimes" )
	if ( _times < 1 )
	{
		notify.MsgBox( "This is the first time you've launched AcecoolAHK_Framework! Thank you and welcome :-)`n`nIf config.ini does not automatically get created in the root directory, you may need to run AutoHotkey.exe as administrator for it to happen. The same may be true if _assets\__load_order_files__\, DropBox\Screenshots\ and Dropbox\Public\Screenshots\ don't exist after taking the first screenshot ( If the folders don't exist you'll notice screenshots appearing in the root directory: AcecoolAHK_Framework\ )!`n`n If you have any questions, concerns or suggestions please post on the bitbucket issue-tracker: https://bitbucket.org/Acecool/acecoolsrcds_collection/issues" )
	}


	;; Update the number of times the framework has launched..
	config.Set( "Debug", "RunTimes", _times + 1 )
}