;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Run a function if it exists, otherwise do not and don't give an error ( because the function being executed is using a variable name )
;;
RunFuncIfExists( _name )
{
	If ( IsFunc( _name ) )
	{
		print( "%_name% Function Exists! Executing it!" )
		%_name%( )
	}
}