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
	;;
	;;
	Run( _path, _args )
	{
		Run %_path% %_args%
	}


	;;
	;;
	;;
	RunWait( _path, _args )
	{
		RunWait %_path% %_args%
	}


	;;
	;; Run a function if it exists, otherwise do not and don't give an error ( because the function being executed is using a variable name )
	;;
	RunFuncIfExists( _name )
	{
		if ( IsFunc( _name ) )
		{
			;; Debugging
			; debug.print(  _name . " Function Exists! Executing it!", "", "" )

			;; Return the value of the function call ( if any )
			return %_name%( )
		}

		return false
	}


	;;
	;;
	;;
	GoSubIfExists( _name )
	{
		if IsLabel( _name )
		{
			Gosub %_name%
			return true
		}

		return false
	}


	;;
	;;
	;;
	GoToIfExists( _name )
	{
		if IsLabel( _name )
		{
			GoTo %_name%
			return true
		}

		return false
	}


	;;
	;;
	;;
	; IsProcessRunning( _name )
	; {
		; return ( window.Get( "ProcessName", _name ) != "" ) ? false : _file
	; }
}