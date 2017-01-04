;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; OnInit / Setup
;;
OnInit_library_window( )
{
	window.example( )
}


;;
;; Variables, CONSTants, ENUMerations, etc..
;;
class window
{
	;;
	;; Example Function to demonstrate functions in this library...
	;;
	example( )
	{
	
	}


	;;
	;;
	;;
	_____( )
	{
	
	}


	;;
	;;
	;; _cmd: ID, IDLast, PID, ProcessName, ProcessPath, Count, List, MinMax, ControlList, ControlListHwnd, Transparent, TransColor, Style or ExStyle
	;;
	Get( _cmd := "ID", _title := "", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		WinGet, _return, %_cmd%, %_title%, %_text%, %_exclude_title%, %_exclude_text%
		return _return
	}


	;;
	;; Returns true if the window is active, false otherwise.
	;;
	IfActive( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		_id := WinActive( _title, _text, _exclude_title, _exclude_text )
		if ( _id != "" )
			return _id

		return false
	}


	;;
	;; Returns true if the window is not active, false otherwise.
	;;
	IfNotActive( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		return !this.IfWinActive( _title, _text, _exclude_title, _exclude_text )
	}


	;;
	;; Returns true if the window, by class name, is active, false otherwise.
	;;
	IfClassActive( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		return this.IfWinActive( "ahk_class " . _title, _text, _exclude_title, _exclude_text )
	}


	;;
	;; Returns true if the window, by class name, is not active, false otherwise.
	;;
	IfClassNotActive( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		return !this.IfWinClassActive( _title, _text, _exclude_title, _exclude_text )
	}


	;;
	;; Returns true if the window exists, false otherwise.
	;;
	IfExist( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		_id := WinExist( _title, _text, _exclude_title, _exclude_text )
		if ( _id != "" )
			return _id

		return false
	}


	;;
	;; Returns true if the window doesn't exist, false otherwise.
	;;
	IfNotExist( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		return !this.IfWinExist( _title, _text, _exclude_title, _exclude_text )
	}


	;;
	;; Returns true if the window, by class name, exists, false otherwise.
	;;
	IfClassExist( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		return this.IfWinExist( "ahk_class " . _title, _text, _exclude_title, _exclude_text )
	}


	;;
	;; Returns true if the window, by class name, doesn't exist, false otherwise.
	;;
	IfClassNotExist( _title := "Task Manager", _text := "", _exclude_title := "", _exclude_text := "" )
	{
		return !this.IfWinClassExist( _title, _text, _exclude_title, _exclude_text )
	}
}