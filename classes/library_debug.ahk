;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
; debug.example( )


;;
;; Debugging Library
;;
class debug
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		;; Print example...
		this.print( "Testing the debugging library..." )
	}


	;;
	;; Simple Output to DebugView...
	;;
	print( _text )
	{
		OutputDebug, [ AcecoolAHK_Framework::Debugger ] %_text%
	}
}