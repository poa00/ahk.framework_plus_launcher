;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;;
;;
OnInit_library_input( )
{
	input.example( )
}


;;
;; IO Library...
;;
class input
{
	; The dx and dy parameters contain normalized absolute coordinates. If not set, those parameters contain relative data: the change in position since the last reported position. This flag can be set, or not set, regardless of what kind of mouse or mouse-like device, if any, is connected to the system. For further information about relative mouse motion, see the following Remarks section.
	static MOUSEEVENTF_ABSOLUTE := 0x8000

	; The left button is down.
	static MOUSEEVENTF_LEFTDOWN := 0x0002

	; The left button is up.
	static MOUSEEVENTF_LEFTUP := 0x0004

	; The middle button is down.
	static MOUSEEVENTF_MIDDLEDOWN := 0x0020

	; The middle button is down.
	static MOUSEEVENTF_MIDDLEUP := 0x0040

	; Movement occurred.
	static MOUSEEVENTF_MOVE := 0x0001

	; The right button is down.
	static MOUSEEVENTF_RIGHTDOWN := 0x0008

	; The right button is up.
	static MOUSEEVENTF_RIGHTUP := 0x0010

	; The wheel button is rotated. ; The wheel has been moved, if the mouse has a wheel. The amount of movement is specified in dwData
	static MOUSEEVENTF_WHEEL := 0x0800

	; An X button was pressed.
	static MOUSEEVENTF_XDOWN := 0x0080

	; An X button was released.
	static MOUSEEVENTF_XUP := 0x0100

	; The wheel button is tilted.
	static MOUSEEVENTF_HWHEEL := 0x01000


	;;
	;;
	;;
	example( )
	{
		; this.IsKeyUp( _key )
		; this.IsKeyDown( _key )
		; this.SendMouseRelativeMove( 50, 50 )
		; this.SendMouseAbsoluteMove( 500, 500 )
		; this.SendMouseLeftClick( )
		; this.SendMouseMiddleClick( )
		; this.SendMouseRightClick( )
	}


	;;
	;;
	;;
	GetKeyState( _key )
	{
		return GetKeyState( _key )
	}


	;;
	;; Is the key released or not toggled
	;;
	IsKeyUp( _key )
	{
		return !this.IsKeyDown( _key )
	}


	;;
	;; Is the key pushed down or toggled on
	;;
	IsKeyDown( _key )
	{
		return this.GetKeyState( _key )
	}


	;;
	;; Simulate Left Mouse Click
	;;
	SendMouseLeftClick( )
	{
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_LEFTDOWN )
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_LEFTUP )
	}


	;;
	;; Simulate Mouse Wheel Click
	;;
	SendMouseMiddleClick( )
	{
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_MIDDLEDOWN )
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_MIDDLEUP )
	}


	;;
	;; Simulate Right Mouse Click
	;;
	SendMouseRightClick( )
	{
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_RIGHTDOWN )
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_RIGHTUP )
	}


	;;
	;; Move the mouse relative to its current position
	;;
	SendMouseRelativeMove( _x := 0, _y := 0 )
	{
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_MOVE, "UInt", _x, "UInt", _y )
	}


	;;
	;; Move the mouse to set coordinates...
	;;
	SendMouseAbsoluteMove( _x := 0, _y := 0 )
	{
		_x_mod := A_ScreenWidth / 65535
		_y_mod := A_ScreenHeight / 65535
		DllCall( "mouse_event", "UInt", this.MOUSEEVENTF_ABSOLUTE, "UInt", _x * _x_mod, "UInt", _y * _y_mod )
	}
}