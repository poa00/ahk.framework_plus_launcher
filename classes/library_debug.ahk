;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; On Startup Setup config
;;
OnInit_library_debug( )
{
	;; Provides example as to how the debug class works...
	; debug.example( )

	;; Setup Default Configuration Values...
	config.SetDefault( "Debug", "DeveloperMode", false )
}


;;
;; Used for debugging - displays example of what this library can do...
;;


;;
;; Debugging Library
;;
class debug
{
	;;
	;; Class Variables..
	;;

	;; Framework-wide Debugging / Developer Mode ( Enables debug.print output )...
	static __DEV_MODE__ := !true


	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		;; Print example...
		this.print( "Testing the debugging library..." )
	}


	;;
	;; Developer Mode / Debugging...
	;;
	DeveloperMode( )
	{
		; _dev := ( config.Get( "Debug", "DeveloperMode" ) ) ? true: false
		return this.__DEV_MODE__
	}


	;;
	;; Simple Output to DebugView...
	;;
	print( _text, _category:="", _sub:="" )
	{
		if ( this.DeveloperMode( ) )
			ahk.OutputDebug( "[ AcecoolDebug ] " . _text )
	}
}