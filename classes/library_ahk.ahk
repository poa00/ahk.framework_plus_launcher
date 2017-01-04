;;
;; Converts default commands into functions so getter functions can be used, etc.. - Josh 'Acecool' Moser
;;


;;
;;
;;
OnInit_library_ahk( )
{
	ahk.example( )
}


;;
;; AutoHotkey Command to Function Translation Library
;;
class ahk
{
	;;
	;;
	;;
	example( )
	{
		; if ( window.Get( "ProcessName", "Taskmgr.exe" ) )
			; notify.MsgBox( "It is running!" )
		; else
			; notify.MsgBox(  util.IsProcessRunning( "Taskmgr.exe" ) )
	}


	;;
	;; Check if alphanumeric character is between upper and lower values
	;;
	IfBetween( _value, _lower, _upper )
	{
		if _value between _lower and _upper
			return true

		return false
	}


	;;
	;; Check if alphanumeric character is not between upper and lower values
	;;
	IfNotBetween( _value, _lower, _upper )
	{
		return !this.IsBetween( _value, _lower, _upper )
	}


	;;
	;; Returns true or false depending on whether or not _value exists in the table _tab
	;;
	IfIn( _value, _tab )
	{
		if _value in %_tab%
			return true

		return false
	}


	;;
	;; Returns true or false depending on whether or not _value doesn't exist in the table _tab
	;;
	IfNotIn( _value, _tab )
	{
		return !this.IfIn( _value, _tab )
	}


	;;
	;;
	;;
	IfContains( _value, _tab )
	{
		if _value contains %_tab%
			return true

		return false
	}


	;;
	;;
	;;
	IfNotContains( _value, _tab )
	{
		return !this.IfContains( _value, _tab )
	}


	;;
	;;
	;;
	IfIs( _value, _tab )
	{
		if _value is %_tab%
			return true

		return false
	}


	;;
	;;
	;;
	IfIsNot( _value, _tab )
	{
		return !this.IfIs( _value, _tab )
	}


	;;
	;;
	;;
	OutputDebug( _text )
	{
		OutputDebug, %_text%

		return _text
	}
}