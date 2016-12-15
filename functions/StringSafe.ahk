;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Converts a string into a file-safe string...
;;
StringSafe( _name )
{
	StringReplace, _name, _name, %A_SPACE%, _, All
 	StringReplace, _name, _name, |;;|, _, All
	StringReplace, _name, _name, ., _dot_, All
	StringReplace, _name, _name, :, _, All
	StringReplace, _name, _name, <, _, All
	StringReplace, _name, _name, >, _, All
	StringReplace, _name, _name, /, _, All
	StringReplace, _name, _name, \, _, All
	StringReplace, _name, _name, -, _, All
	StringReplace, _name, _name, ___, _, All
	StringReplace, _name, _name, __, _, All

	return _name
}
