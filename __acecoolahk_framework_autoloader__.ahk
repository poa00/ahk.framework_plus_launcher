;;
;; AcecoolAHK_Framework AutoLoader File - Contains all necessary functions to load everything dynamically - Josh 'Acecool' Moser
;;


;;
;; Variables, CONSTants, ENUMerations, etc..
;;
global AUTO_LOADER_ID
AUTO_LOADER_ID = default_id
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

;;
;; Assume each line is a file and run #include on it ( this won't work most likely so I need to evaluate the file instead as ahk and save data as #include .. )
;;
FileIO_CopyFile( _src, _dest, _overwrite := false )
{
	FileCopy, %_src%, %_dest%, %_overwrite%
}


;;
;; Read data from file
;;
FileIO_ReadFile( _path )
{
	FileRead, _data, %_path%

	if !_data
		return "X"
	else
		return _data
}


;;
;; Helper to append data to a file in function format...
;;
FileIO_Append( _path, _data )
{
	FileAppend, %_data%, %_path%
}


;;
;; Helper to add newlines to a file...
;;
FileIO_AddNewLines( _times )
{
	_times := ( _times is digit ) ? _times : 1

	;; "_assets\_autoloader\" . 
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), String_Repeat( "`n", _times ) )
}


;;
;;
;;
FileIO_Delete( _path )
{
	FileDelete, %_path%
}


;;
;; String Functions
;;


;;
;; Repeat a string n _times...
;;
String_Repeat( _string, _times )
{
	;; Predeclare
	_output := ""

	;; In case 0 or negative number was used...
	if _times < 1
		return _output

	;; Repeat the string n _times
	loop, %_times%
		_output .= _string

	;; Return the newly concatenated repeated string
	return _output
}


;;
;; AutoLoader Functions
;;


;;
;;
;;
AutoLoader_ActiveLoaderFile( )
{
	; return "_assets\_autoloader\" . AUTO_LOADER_ID . ".ahk"
	return "_" . AUTO_LOADER_ID . "_.ahk"
}


;;
;; Reset the load_order file so it can be recreated...
;;
AutoLoader_ResetLoader( _id )
{
	AUTO_LOADER_ID := _id


	; MsgBox, Reset %_id%
	;; Delete load_order.ahk if it exists...
	if FileExist( AutoLoader_ActiveLoaderFile( ) )
		FileIO_Delete( AutoLoader_ActiveLoaderFile( ) )

	;; Create the file...

	; IfExist, AutoLoader_ActiveLoaderFile( )
		; FileIO_Delete, AutoLoader_ActiveLoaderFile( )

	;; Copy __default__.ahk and name that copy as load_order.ahk ( The base for the new load-order )
	FileIO_CopyFile( "_assets\_autoloader\__default__.ahk", AutoLoader_ActiveLoaderFile( ), true )

	;; Add a few newlines before adding __pre_load_order__ so header ( template ) follows my code-standards ( double-newline gap between it and PRE )...
	FileIO_AddNewLines( 2 )

	;; Append the contents of __pre_load_order__.ahk to load_order.ahk
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), FileIO_ReadFile( "_assets\_autoloader\__pre_load_order__.ahk" ) )

	;; Add a few newlines after adding __pre_load_order__ so it won't interfere with first-include and follows my code-standards ( double-newline gap )...
	FileIO_AddNewLines( 2 )
}


;;
;; Finalize the AutoLoader load_order.ahk Generated File by appending new-lines as a seperator and the __post_load_order__.ahk to it
;;
AutoLoader_Finish( )
{
	;; Add a few newlines before adding __post_load_order__ so it won't interfere with last-include and follows my code-standards ( double-newline gap )...
	FileIO_AddNewLines( 3 )

	;; Append the contents of __post_load_order__.ahk to load_order.ahk after everything has loaded...
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), FileIO_ReadFile( "_assets\_autoloader\__post_load_order__.ahk" ) )

	;;
	; #include AutoLoader_ActiveLoaderFile( )
	AutoLoader_WaitForFile( )
}


;;
;; Creates an Include Entry for our load_order.ahk File
;;
AutoLoader_CreateIncludeEntry( _path )
{
	_data = `n`#include %_path%
	return _data
}


;;
;; Creates an Include Entry for our load_order.ahk File
;;
AutoLoader_CreateRunEntry( _path )
{
	_data = `nrun %_path%
	return _data
}


;;
;; Appends an Include Entry to our load_order.ahk file...
;;
AutoLoader_AddInclude( _path )
{
	;; Append the contents of __post_load_order__.ahk to load_order.ahk after everything has loaded...
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), AutoLoader_CreateIncludeEntry( _path ) )
}


;;
;; Appends an Include Entry to our load_order.ahk file...
;;
AutoLoader_AddRun( _path )
{
	;; Append the contents of __post_load_order__.ahk to load_order.ahk after everything has loaded...
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), AutoLoader_CreateRunEntry( _path ) )
}


;;
;;
;;
AutoLoader_ReadFiles( _dir, _run_instead := false )
{
	loop Files, %_dir%\*.ahk ; *\, R  ; Recurse into subfolders.
	{
		;;%_dir%\
		_path = %A_ScriptDir%\%A_loopFileFullPath%

		if !_run_instead
			AutoLoader_AddInclude( _path )
		else
			AutoLoader_AddRun( _path )
	}
}


;;
;;
;;
AutoLoader_WaitForFile( )
{
	while true
		if ! FileExist( AutoLoader_ActiveLoaderFile( ) )
			sleep 250
		else
			break
}