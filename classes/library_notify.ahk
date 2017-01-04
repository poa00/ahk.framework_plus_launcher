;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
; notify.example( )


;;
;; Notification Library
;;
class notify
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		this.MsgBox( "Message Box Example" )
		this.ToolTip( "Message ToolTip Example" )
		this.TrayTip( "Message TrayTip Example" )
		this.SplashScreen( "Message Splash-Screen on Primary Monitor Example" )
		this.debug( "Debug Message Example" )
	}


	;;
	;; If _button was chosen, or defaulted to, return true - else false...
	;; Yes / No / OK / Cancel / Abort / Ignore / Retry / Continue / TryAgain / Timeout
	;;
	IfMsgBox( _button )
	{
		IfMsgBox, %_button%
			return true

		return false
	}


	;;
	;; Open up a message box with the contents
	;;
	MsgBox( _data* )
	{
		MsgBox % string.join( "`n", _data* )
	}


	;;
	;; Open up a message box with the contents
	;;
	ToolTip( _text )
	{
		;; Create our tooltip
		ToolTip, %_text%

		;; Set up a timer to close the tooltip 1 second after mouse has moved off of it
		SetTimer, CloseThisToolTipIfMouseMoved, 1000

		;; So we can set up our timer within the function
		return


		;;
		;; Internal "Function" / GoTo - handles removing the tooltip 1 after the mouse is no longer on top of the tooltip..
		;;
		CloseThisToolTipIfMouseMoved:
			;; Check to see if the tooltip exists; if so the return will be the process-id or window-id
			_tip := WinExist( "ahk_class tooltips_class32" )

			;; Grab the current mouse position, and more importantly what is under the _mouse
			MouseGetPos, , , _mouse

			this.MsgBox( _mouse )
			;; If the object under the mouse isn't our tooltip
			if ( _mouse != _tip )
			{
				;; Kill our timer
				SetTimer, CloseThisToolTipIfMouseMoved, off

				;; And clear our tooltip
				ToolTip
			}
		return
	}


	;;
	;; Helper function to remove a ToolTip ( Simply calls ToolTip without parameters )
	;; Note, this doesn't work for some reason.. probably because this call would be out of the scope where the other was created??
	;;	
	RemoveToolTip( )
	{
		ToolTip
	}


	;;
	;; Open up a message box with the contents
	;;
	TrayTip( _text, _title="", _delay:=5, _icon:=1 )
	{
		TrayTip, %_title%, %_text%, %_delay%, %_icon%
	}


	;;
	;; Helper function to remove a TrayTip ( Simply calls TrayTip without parameters )
	;;	
	RemoveTrayTip( )
	{
		TrayTip
	}


	;;
	;; Open up a message box with the contents on a certain monitor at a certain position ( 9 slot grid default being center - NumPad to determine location )
	;;
	SplashScreen( _text, _pos:=5 )
	{

	}


	;;
	;; Send a print / notification to DebugView
	;;
	debug( _text )
	{
		debug.print( "[ C.Notify ] " . _text, "", "" )
	}
}