;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
; string.example( )


;;
;; String Library
;;
class string
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		;; Showing String Repeat
		debug.print( this.repeat( "Repeat This! ", 10 ) )

		;; Showing String safe
		debug.print( this.safe( "String.Safe:AbCdEfGhIjKlMnOpQrStUvWxYz 01234567890 !@#$%^&*()_+" ) )

		;; Showing String safe_ntfs
		debug.print( this.safe_ntfs( "String.Safe_NTFS: AbCdEfGhIjKlMnOpQrStUvWxYz \ / : * ? "" < > | 01234567890 !@#$^&*()_+" ) )

		;; Showing String safe_ntfs
		debug.print( this.safe( this.safe_ntfs( "String.Safe_NTFS and Safe: AbCdEfGhIjKlMnOpQrStUvWxYz \ / : * ? "" < > | 01234567890 !@#$^&*()_+" ) ) )
	}


	;;
	;; Repeat String n times...
	;;
	repeat( _text, _times:=1 )
	{
		;; Predeclare
		_output := ""

		;; In case 0 or negative number was used...
		if _times < 1
			return _output

		;; Repeat the string n _times
		loop, %_times%
			_output .= _text

		;; Return the newly concatenated repeated string
		return _output
	}


	;;
	;; Make string "safe" ( Specifically only allow [a-zA-Z0-9_-] )
	;;
	safe( _text, _replacement="_" )
	{
		;; Remove non-word characters...
		_text := RegExReplace( _text, "[\W-]", _replacement )
		_text := this.replace_spaces( _text )
		_text := this.replace_underscores( _text )

		return _text
	}


	;;
	;; Make string "safe" ( Specifically NT File-System file-name safe meaning it can not contain: \ / : * ? " < > | ) - we'll allow anything else though...
	;;
	safe_ntfs( _text, _replacement="_" )
	{
		_text := RegExReplace( _text, "[\\/:\*\?""<>|]", _replacement )

		return _text
	}


	;;
	;; Removes spaces
	;;
	replace_spaces( _text, _replacement="" )
	{
		_text := RegExReplace( _text, "\s+", _replacement )

		return _text
	}


	;;
	;; Removes Duplicate Underscores.
	;;
	replace_underscores( _text, _replacement="" )
	{
		_text := RegExReplace( _text, "_+", _replacement )

		return _text
	}


	;;
	;; Trims
	;;
	trim( _text, _omit = " `t" )
	{
		return Trim( _text, _omit )
	}


	;;
	;; Trims
	;;
	ltrim( _text, _omit = " `t" )
	{
		return LTrim( _text, _omit )
	}


	;;
	;; Trims
	;;
	rtrim( _text, _omit = " `t" )
	{
		return RTrim( _text, _omit )
	}


	;;
	;; URL Encode _text
	;;
	urlencode( _text )
	{
	
	}


	;;
	;; URL Decode _text
	;;
	urldecode( _text )
	{
	
	}
}