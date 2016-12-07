;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Variables, CONSTants, ENUMerations, etc..
;;



;;
;; Script Config
;;

;; Enable warnings to assist with detecting common errors.
; #Warn

;; Disable single-instance ( For Jobs / Processes )
#SingleInstance off

;;
#Persistent

;; DEFAULT: Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv

;; Recommended for new scripts due to its superior speed and reliability.
SendMode Input

;; Allow hotkeys to run in additional threads / windows..
#MaxThreadsPerHotkey 10

;;
#InstallKeybdHook
#InstallMouseHook

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_AppData%/../../Dropbox/AcecoolAHK_Framework/

;; Set the default tray icon ( Can only be set 1 time?? )... eg: Menu, Tray, Icon, shell32.dll, 44 ;; Favorites Star
Menu, Tray, Icon, _assets/icons/favicon.ico


;;
;; FileIO Functions
;;


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
	FileIO_Append( "_assets/_autoloader/load_order.ahk", String_Repeat( "`n", _times ) )
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
;; Reset the load_order file so it can be recreated...
;;
AutoLoader_ResetLoader( )
{
	;; Delete load_order.ahk if it exists...
	if FileExist( "_assets/_autoloader/load_order.ahk" )
		FileDelete _assets/_autoloader/load_order.ahk

	;; Copy __default__.ahk and name that copy as load_order.ahk ( The base for the new load-order )
	FileIO_CopyFile( "_assets/_autoloader/__default__.ahk", "_assets/_autoloader/load_order.ahk", true )

	;; Add a few newlines before adding __pre_load_order__ so header ( template ) follows my code-standards ( double-newline gap between it and PRE )...
	FileIO_AddNewLines( 2 )

	;; Append the contents of __pre_load_order__.ahk to load_order.ahk
	FileIO_Append( "_assets/_autoloader/load_order.ahk", FileIO_ReadFile( "_assets/_autoloader/__pre_load_order__.ahk" ) )

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
	FileIO_Append( "_assets/_autoloader/load_order.ahk", FileIO_ReadFile( "_assets/_autoloader/__post_load_order__.ahk" ) )
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
	_data = `n`run %_path%
	return _data
}


;;
;; Appends an Include Entry to our load_order.ahk file...
;;
AutoLoader_AddInclude( _path )
{
	;; Append the contents of __post_load_order__.ahk to load_order.ahk after everything has loaded...
	FileIO_Append( "_assets/_autoloader/load_order.ahk", AutoLoader_CreateIncludeEntry( _path ) )
}


;;
;; Appends an Include Entry to our load_order.ahk file...
;;
AutoLoader_AddRun( _path )
{
	;; Append the contents of __post_load_order__.ahk to load_order.ahk after everything has loaded...
	FileIO_Append( "_assets/_autoloader/load_order.ahk", AutoLoader_CreateRunEntry( _path ) )
}


;;
;;
;;
AutoLoader_ReadFiles( _dir, _run_instead )
{
	loop Files, %_dir%/*.ahk ; */, R  ; Recurse into subfolders.
	{
		_path = %_dir%/%A_loopFileFullPath%

		if !_run_instead
			AutoLoader_AddInclude( _path )
		else
			AutoLoader_AddRun( _path )
	}
}


;;
;;
;;
AutoLoader_ResetLoader( )


;;
;;
;;

;; Read all definition files into inclusion list
AutoLoader_ReadFiles( "definitions" )

;; Read all classes into inclusion list
AutoLoader_ReadFiles( "classes" )

;; Read all functions into inclusion list
AutoLoader_ReadFiles( "functions" )

;; Libraries are loaded automatically via scripts that use them
; AutoLoader_ReadFiles( "libraries" )

;; Read all hotkeys into inclusion list
AutoLoader_ReadFiles( "hotkeys" )

;; Read all processes into inclusion list ( or maybe not.. I will need to read them for the gui I have planned, but these should
;;	be loaded like classes.. when scripts need them. )
; AutoLoader_ReadFiles( "processes" )

;; Read all modules / addons into inclusion list ( These are stand-alone hotkey systems that I want to run when I run AHK such as
;; the DOpus Middle Click system )...
AutoLoader_ReadFiles( "addons", true )


;; Finish up with load_order.ahk
AutoLoader_Finish( )


;; Now load it...
#include _assets/_autoloader/load_order.ahk










		; MsgBox, 4, , Filename = %A_loopFileFullPath%`n`nContinue?
		; IfMsgBox, No
			; break
	; FileAppend `n#include %_path%, _assets/_autoloader/load_order.ahk
	; _data = `n`#include %_path%

;; Not needed with a properly formulated SetWorkingDir
; #include %A_AppData%/../../Dropbox/AcecoolAHK_Framework/
	; FileCopy, _assets/_autoloader/__default__.ahk, _assets/_autoloader/load_order.ahk, 1

	;; Now load it...
	; #include _assets/_autoloader/load_order.ahk
	; FileRead, _data, _assets/_autoloader/__post_load_order__.ahk
	; FileAppend %_data%, _assets/_autoloader/load_order.ahk
	; FileAppend `n`n`n, _assets/_autoloader/load_order.ahk
	; FileRead, _template, _assets/_autoloader/__default__.ahk
	; FileRead, _pre_data, _assets/_autoloader/__pre_load_order__.ahk
	; FileAppend `n`n, _assets/_autoloader/load_order.ahk
	; FileAppend %_template%, _assets/_autoloader/load_order.ahk
	; FileAppend %_pre_data%, _assets/_autoloader/load_order.ahk
	; FileAppend `n`n, _assets/_autoloader/load_order.ahk


; Example #1:
; loop Files, %A_ProgramFiles%/*.txt ; */, R  ; Recurse into subfolders.
; {
    ; MsgBox, 4, , Filename = %A_loopFileFullPath%`n`nContinue?
    ; IfMsgBox, No
        ; break
; }

; loop
; {
    ; FileReadLine, line, test.txt, %A_Index%
    ; if ErrorLevel
        ; break

	; MsgBox, 4, , Line #%A_Index% is "%line%".  Continue?

	; #include test.txt
    ; MsgBox, 4, , Line #%A_Index% is "%line%".  Continue?
    ; IfMsgBox, No
        ; return
; }

; return


; ExitApp