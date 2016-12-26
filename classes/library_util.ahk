;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
; util.example( )


;;
;; Utility Library
;;
class util
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{

	}


	;;
	;; Run a function if it exists, otherwise do not and don't give an error ( because the function being executed is using a variable name )
	;;
	RunFuncIfExists( _name )
	{
		If ( IsFunc( _name ) )
		{
			debug.print( _name . " Function Exists! Executing it!" )
			%_name%( )
		}
	}
}