;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
OnInit_library_string( )
{
	; string.example( )
}


;;
;; String Library
;;
class string
{
	;;
	;; Variables
	;;
	static SPACES_PER_TAB := 4


	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		;; Line 1 and Example 1
		_ex1 := this.FormatColumn( 15, "Filename!", 30, "Permissions!", 40, "Description!" )
		_ex1b := this.FormatColumn( 20, "File.txt", 24, "123456789012345 X", 40, "Human primitive can't explain color! Cutoff!" )
		_ex1c := this.FormatColumn( 20, "File.txt", 24, "rw-rw-rw-rw-rw-rw", 40, "Human primitive can't explain color! Cutoff!" )
		_ex1d := this.FormatColumn( 20, "File.txt", 24, "rw-rw-rw-rw-rw-rw", 40, "Human primitive can't explain color! Cutoff!" )
		_line1 = Example 1:`nNote: These aren't properly aligned because the font isn't monospaced / fixed-pitch / fixed-width / non-proportional meaning the characters are different widths - but with a monospaced font such as debug console this works beautifully!`n`nthis.FormatColumn( 15, "Filename!", 30, "Permissions!", 40, "Description!" )`n`n%_ex1%`n%_ex1b%`n%_ex1c%`n%_ex1d%`n


		;; Line 2 and Example 2
		_ex2 := this.FormatSimpleColumn( 25, "Filename!", "Permissions!", "Description!" )
		_ex2b := this.FormatSimpleColumn( 25, "All of the", "column widths", "are the same" )
		_ex2c := this.FormatSimpleColumn( 25, "size which is", "great for", "keeping things" )
		_ex2d := this.FormatSimpleColumn( 25, "simple when", "we just want", "to debug!" )
		_line2 = Example 2:`nNote: Same as string.FormatColumn except string.FormatSimpleColumn sets all of the column widths to the same size to keep things simple...`n`nthis.FormatSimpleColumn( 25, "Filename!", "Permissions!", "Description!" )`n`n%_ex2%`n%_ex2b%`n%_ex2c%`n%_ex2d%`n

		;; Line 3 and Examples 3 and 3b
		; _ex3 := math.powx( 63, 2 )
		; _ex3b := math.powx( 64, 2 )
		_line3 = Empty

		;; Line 4 and Examples 4, 4b and 4c
		; _ex4 := math.powxp( 63, 2 )
		; _ex4b := math.powxp( 64, 2 )
		; _ex4c := math.powxp( 65, 2 )
		_line4 = Empty

		;; Line 5 and Example 5
		; _ex5:=math.SnapTo( 83, 45 )
		_line5 = Empty

		;; Line 6 and Example 6
		; _ex6:=math.min( 8423, -10, -444, 894, 1231 )
		_line6 = Empty

		;; Line 7 and Example 7
		; _ex7:=math.max( 8423, -10, -444, 894, 1231 )
		_line7 = Empty

		;; Line 8 and Example 8
		; _ex8:=math.clamp( -1234, 0, 4096 )
		; _ex8b:=math.clamp( 8192, 0, 4096 )
		_line8 = Empty

		;; Line 9 and Example 9
		; _ex9:=math.xxx( )
		_line9 = Empty ;		`n-> math.xxx( ) == %_ex9%`n

		;; Line 10 and Example 10
		; _ex10 := math.log( 1 )
		_line10 = Empty ;		`n-> math.log( 1 ) == %_ex10%`n

		; MsgBox, AcecoolAHK_Framework Math Library Example`n`n%_line1%`n%_line2%`n%_line3%`n%_line4%`n%_line5%`n%_line6%`n%_line7%`n%_line8%`n%_line9%`n%_line10%
		notify.MsgBox( _line1, _line2, _line3, _line4, _line5, _line6, _line7, _line8, _line9, _line10 )


		;; Showing String Repeat
		; debug.print( this.repeat( "Repeat This! ", 10 ), "", "" )

		;; Showing String safe
		; debug.print( this.safe( "String.Safe:AbCdEfGhIjKlMnOpQrStUvWxYz 01234567890 !@#$%^&*()_+" ), "", "" )

		;; Showing String safe_ntfs
		; debug.print( this.safe_ntfs( "String.Safe_NTFS: AbCdEfGhIjKlMnOpQrStUvWxYz \ / : * ? "" < > | 01234567890 !@#$^&*()_+" ), "", "" )

		;; Showing String safe_ntfs
		; debug.print( this.safe( this.safe_ntfs( "String.Safe_NTFS and Safe: AbCdEfGhIjKlMnOpQrStUvWxYz \ / : * ? "" < > | 01234567890 !@#$^&*()_+" ) ), "", "" )
	}


	;;
	;; Returns true or false depending on whether or not _value exists in the table _tab
	;;
	IfInString( _value, _text, _case_sensitive := false, _start_pos := 0, _occurence := 1 )
	{
		if InStr( _text, _value, _case_sensitive, _start_pos )
			return true

		return false
	}


	;;
	;; Returns true or false depending on whether or not _value doesn't exist in the table _tab
	;;
	IfNotInString( _value, _text, _case_sensitive := false, _start_pos := 0, _occurence := 1 )
	{
		return !this.IfInString( _value, _text )
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
	;; Concatenate _data with a delimiter between chunks..
	;; Not sure why Join uses this? ; this.sub( _text, 1, -this.len( _delimiter ) )
	;;
	join( _delimiter, _data* )
	{
		for _k, _v in _data
			_text .= _v . _delimiter

		return _text
	}


	;;
	;; Sets up string columns - excellent for debugging!
	;; Note: Works best with fonts that are: monospaced / fixed-pitch / fixed-width / non-proportional - ie where all chars are the same width such as Cmd Prompt!
	;;
	FormatColumn( _data* )
	{
		;; This is the string we're assembling
		_width := _data[ 1 ]
		_text := _data[ 2 ]

		;; Replace tabs with n spaces as declared above ( may turn it into config setting )
		_text := this.replace( _text, "`t", this.repeat( A_Space, this.SPACES_PER_TAB ) )

		;; Count the number of args ( so we can do a recursive call.. ie do we have enough to do a recursive call )
		_more := ( ( _data.MaxIndex( ) / 2 ) > 0 ) ? true : false

		;; Check how many spaces need to be added to the end, using the maximum of the 2 numbers ( ensuring negatives aren't used ); none if there aren't any more columns..
		_reps := math.max( 0, ( ( _more == true ) ? ( _width - this.len( _text ) ) : 0 ) ) ;

		;; Concatenate by appending the number of spaces needed to _text and truncate any data in the column which exceeds _width length
		_text := this.sub( _text . ( ( _reps > 0 ) ? string.repeat( A_Space, _reps ) : "" ), 1, _width )

		;; Recursion: If we have at least 2 more arguments, concatenate the data returned by this function from a new call by appending it to the data we just defined
		if ( _more )
		{
			_data.Remove( 1 )
			_data.Remove( 1 )
			_text .= this.FormatColumn( _data* )
		}

		;; Return and the stack collapses
		return _text
	}


	;;
	;; Same as Format Column except all the widths are the same, therefore it is called: string.FormatSimpleColumn( 10, "blah", "next", "etc...." )
	;;
	FormatSimpleColumn( _width, _data* )
	{
		;; Call our primary function and grab the data for the first iteration
		_text := this.FormatColumn( _width, _data[ 1 ] )

		;; If we have at least 1 more _text argument ( ie index needs to be 2 or greater because we used [ 1 ] )
		if ( _data.MaxIndex( ) > 1 )
		{
			;; Instead of recursing, I chose iteration because we already referenced _tab and we won't need 2 recursive calls * _text args
			for _k, _v in _data
			{
				;; Skip the one we've already done...
				if ( _k < 2 )
					continue

				_text .= this.FormatColumn( _width, _v )
			}
		}

		return _text
	}


	;;
	;;
	;;
	sub( _text, _start, _end )
	{
		return SubStr( _text, _start, _end )
	}


	;;
	;;
	;;
	len( _text )
	{
		return StrLen( _text )
	}


	;;
	;;
	;;
	replace( _text, _find, _replace := "", _count := 0, _limit := -1 )
	{
		_return := StrReplace( _text, _find, _replace, _count, _limit )

		return _return
	}


	;;
	;; Make string "safe" ( Specifically only allow [a-zA-Z0-9_-] )
	;;
	safe( _text, _replacement="_" )
	{
		;; Remove non-word characters...
		_text := RegExReplace( _text, "[\W-]", _replacement )
		_text := this.replace_spaces( _text )
		_text := this.replace_duplicate_underscores( _text )

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
	replace_underscores( _text, _replacement="_" )
	{
		_text := RegExReplace( _text, "_+", _replacement )

		return _text
	}


	;;
	;; Removes Duplicate Underscores.
	;;
	replace_duplicate_underscores( _text, _replacement="_" )
	{
		_text := RegExReplace( _text, "__+", _replacement )

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