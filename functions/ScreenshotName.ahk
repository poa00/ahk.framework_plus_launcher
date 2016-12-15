;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Clean Screenshot Name
;;
ScreenshotName( )
{
	WinGet, hwnd, ID, A
	WinGetActiveTitle, _name
	StringLower, _name, _name

	_match := RegExMatch( _name, "-(.*)$", __, 1 )
	_chatmatch := RegExMatch( _name, "-(.*) - chat$i", __, 1 )

	if ( RegExMatch( _name, "chat$", __, 1 ) > 0 )
		_name := SubStr( _name, ( _chatmatch > 1 ) ? _chatmatch + 2 : 1 )
	else
		_name := SubStr( _name, ( _match > 1 ) ? _match + 2 : 1 )

	Random, _random, 0, 9999
	_name := StringSafe( _name )
	_name_clean := _name "_screenshot_" A_Now "_" _random ".png"

	return _name_clean
}
