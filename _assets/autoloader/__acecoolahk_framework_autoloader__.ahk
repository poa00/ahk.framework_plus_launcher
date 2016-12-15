;;
;; AcecoolAHK_Framework AutoLoader File - Contains all necessary functions to load everything dynamically - Josh 'Acecool' Moser
;;


;;
;; Variables, CONSTants, ENUMerations, etc..
;;
global AUTO_LOADER_ID
AUTO_LOADER_ID = default_id


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
		return "X ERROR IN __AcecoolAHK_Framework_AutoLoader__.ahk FileIO_ReadFile( Path: " . _path . " ) X"
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
	return "_assets\__load_order_files__\_" . AUTO_LOADER_ID . "_.ahk"
}


;;
;; Helper Function to include -- won't work.. --
;;
; AutoLoader_IncludeLoaderFile( _id )
; {
	; AutoLoader_SetLoaderID( _id )
	; #include AutoLoader_ActiveLoaderFile( )
; }


;;
;; Helper Function to include -- won't work.. --
;;
AutoLoader_SetLoaderID( _id )
{
	AUTO_LOADER_ID := _id
}



;;
;; Reset the load_order file so it can be recreated...
;;
AutoLoader_ResetLoader( _id )
{
	;; Set thhe Autoloader File ID...
	AutoLoader_SetLoaderID( _id )

	; MsgBox, Reset %_id%
	;; Delete load_order.ahk if it exists...
	if FileExist( AutoLoader_ActiveLoaderFile( ) )
		FileIO_Delete( AutoLoader_ActiveLoaderFile( ) )

	;; Create the file...

	; IfExist, AutoLoader_ActiveLoaderFile( )
		; FileIO_Delete, AutoLoader_ActiveLoaderFile( )

	;; Copy __default__.ahk and name that copy as load_order.ahk ( The base for the new load-order )
	FileIO_CopyFile( "_assets\templates\load_order_default.ahk", AutoLoader_ActiveLoaderFile( ), true )

	;; Add a few newlines before adding __pre_load_order__ so header ( template ) follows my code-standards ( double-newline gap between it and PRE )...
	FileIO_AddNewLines( 2 )

	;; Append the contents of __pre_load_order__.ahk to load_order.ahk
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), FileIO_ReadFile( "_assets\templates\pre_load_order.ahk" ) )

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
	FileIO_Append( AutoLoader_ActiveLoaderFile( ), FileIO_ReadFile( "_assets\templates\post_load_order.ahk" ) )

	;;
	; #include AutoLoader_ActiveLoaderFile( )
	AutoLoader_WaitForFile( )
}


;;
;; Creates an Include Entry for our load_order.ahk File
;;
AutoLoader_CreateIncludeEntry( _path )
{
	_data = `n`#include %_path%`n

	return _data
}


;;
;; Creates an Include Entry for our load_order.ahk File
;;
AutoLoader_CreateRunEntry( _path )
{
	; _data = `nrun cmd %_path%
	;Process, Close, `%__cmd`%
	_data = `nRun, %ComSpec% /c %_path%,,Hide,__cmd`n

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
;; Loop through all files in the directory and add the Include or Run execution line to the active / working load-order file.
;;
AutoLoader_ReadFiles( _dir, _run_instead := false, _is_dangerous_folder := false, _ignore_warnings := false )
{
	loop Files, %_dir%\*.* ; *\, R  ; Recurse into subfolders.
	{
		;; We can safely skip readme files / txt files... Also chm, html, etc..
		;; May as well skip images too..
		if A_LoopFileExt in chm,htm,html,txt,jpg,jpeg,gif,png,ico,7z,rar,zip
			continue

		;; Are we processing a dangerous folder?
		if ( _is_dangerous_folder )
		{
			;; If we want to manage which protentially dangerous files we allow...
			if ( !_ignore_warnings )
			{
				;; Ask whether to allow or deny the file..
				; Ext: %A_LoopFileExt% Exe: %_run_instead% Danger: %_is_dangerous_folder% IgnoreDanger: %_ignore_warnings%
				MsgBox, 4, Allow Running This Potentially Dangerous File?, Allow File: %A_LoopFileName% 

				;; We denied the file.. skip adding it to the list..
				IfMsgBox No
					continue
			}
		}

		AutoLoader_ProcessFile( A_loopFileFullPath, _run_instead )
	}
}


;;
;;
;;
AutoLoader_ProcessFile( _path, _run_instead := false )
{
		if !_run_instead
			AutoLoader_AddInclude( _path )
		else
			AutoLoader_AddRun( _path )
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