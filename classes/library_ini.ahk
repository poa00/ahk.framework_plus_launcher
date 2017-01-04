;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; OnInit / Setup
;;
OnInit_library_ini( )
{
	ini.example( )
}


;;
;; Variables, CONSTants, ENUMerations, etc..
;;
class ini
{
	;;
	;; Variables
	;;

	;; Shared CONSTant - Placeholder to show section / key was not found / readable...
	static KEY_NOT_FOUND := "__KEY_NOT_FOUND__"

	;; Maximum Character Length of a _key before it is truncated...
	static MAX_KEY_LENGTH := 25


	;;
	;; Example Function to demonstrate functions in this library...
	;;
	example( )
	{
		;; Testing indented values...
		; _example := this.Get( "config.ini", "AcecoolAHK_Framework", "__this__" )
		; debug.print( _example . " should be: config.ini" )

		; _example := this.Exists( "config.ini", "AcecoolAHK_Framework", "__this__" )
		; debug.print( _example . " should be: true or 1" )
	}


	;;
	;;
	;;
	; _____( )
	; {
	
	; }


	;;
	;; Internal function: Styles the key to increase readability in the ini file...
	;;
	__FormatKey( _key )
	{
		;; Make sure there are 50 character slots ( plus the tab ) that the key can use; so all ='s will be aligned...
		; _key := string.replace( _key, "{X}", "" )
		; _key := string.sub( _key, 1, string.len( _key ) - 1 )
		_key := string.FormatColumn( this.MAX_KEY_LENGTH, _key )

		;; Format as <TAB><KEY><STRING_REPEAT_N_SPACES_MINUS_KEY_LEN>== <VALUE>
		return "	" . _key . "="
	}


	;;
	;; Internal function: Styles the value to increase readability in the ini file...
	;; Add a space after the = and before the value ( this will be removed on read by replacing 1 instance of this.__FormatValue( "" ) - please only prefix )
	;;
	__FormatValue( _value )
	{
		return A_Space . _value
	}


	;;
	;; Internal Helper Function - So we're not stuck using the command which forces us to declare everything into a variable to use on it...
	;;
	__IniRead( _file, _section, _key, _default := "" )
	{
		;; Set the default output ( can't use this.KEY_NOT_FOUND in arg-list )
		_default := ( _default == "" ) ? this.KEY_NOT_FOUND : _default

		;; Read it
		IniRead, _return, %_file%, %_section%, %_key%, %_default%

		;; Return it..
		return _return
	}


	;;
	;; Internal Helper Function - So we're not stuck using the command which forces us to declare everything into a variable to use on it...
	;;
	__IniWrite( _file, _section, _key, _value := "" )
	{
		IniWrite, %_value%, %_file%, %_section%, %_key%
	}


	;;
	;; Internal Helper Function - So we're not stuck using the command which forces us to declare everything into a variable to use on it...
	;;
	__IniDelete( _file, _section, _key := "" )
	{
		IniDelete, %_file%, %_section%, %_key%
	}


	;;
	;; Read and return _key from _section in _file
	;;
	Get( _file, _section, _key, _default := "" )
	{
		;; Debugging
		; debug.print( "Config > Get > From File: > '" this.__FILE__ "' Section: '" _section "' > Key: '" _key "' Value: '" _return "'", "C.ini", "Get" )

		;; Read data from the Ini File
		_return := this.__IniRead( _file, _section, _key, _default )

		;; Remove formatting from the value returned ( currently only prefix allowed; later I may allow quotes, data-typing, etc.. )
		_valuef := this.__FormatValue( "" )
		if ( _valuef != "" )
			_return := string.replace( _return, _valuef, "", 0, 1 )

		;; Return the data...
		return _return
	}


	;;
	;; Set _key from _section in _file ( This will always update the key )
	;;
	Set( _file, _section, _key, _value := "", _default := false )
	{
		;; Debugging
		; debug.print( "Config > Set > Into File: > '" this.__FILE__ "' Section: '" _section "' > Key: '" _key "' Value: '" _value "'", "C.ini", "Set" )

		;; Just in case the dev didn't initialize the section / key by using SetDefault first; this will add the formatting...
		;; Make sure SetDefault wasn't called because if it was, we don't want to double-format our key...
		;; Note: Ternary if I want to remove this if later... ( ( !_default && !this.Exists( _file, _section, _key ) ? this.__FormatKey( _key ) : _key ) )
		if ( !_default && !this.Exists( _file, _section, _key ) )
		{
			_keyf := this.__FormatKey( _key )
			this.__IniWrite( _file, _section, _keyf, this.__FormatValue( _value ) )
		}

		;; Write Data to the Ini File
		this.__IniWrite( _file, _section, _key, this.__FormatValue( _value ) )

		;; A change was made ( Always )
		return true
	}


	;;
	;; Sets _key from _section in _file ( But only if it hasn't been initialized as something else )
	;;
	SetDefault( _file, _section, _key, _value )
	{
		;; Debugging
		; debug.print( "SetDefault( " . _section . ", " . _key . ", " . _value . " )", "C.ini", "SetDefault" )

		;; If the key doesn't exist.. add it with a tab because Set without tab will update it properly..
		if ( !this.Exists( _file, _section, _key ) )
		{
			;; Initialize the Section / Key with the key indented for easier readability...
			this.Set( _file, _section, this.__FormatKey( _key ), _value, true )

			;; Then call again to clear the double-equals...
			this.Set( _file, _section, _key, _value, true )

			;; We initialized the var
			return true
		}

		;; It already exists so no change was made
		return false
	}


	;;
	;; Remove an entire section or just a key in the section ( Doesn't appear to work )
	;;
	Delete( _file, _section, _key := "" )
	{
		if ( this.Exists( _file, _section, _key ) )
		{
			;; Remove the entire section, or just the key in the section depending on args...
			this.__IniDelete( _file, _section, _key )

			;; A change was made
			return true
		}

		;; It doesn't exist therefore no change was made..
		return false
	}


	;;
	;; Checks to see if a Key Exists in a section / category...
	;;
	Exists( _file, _section, _key )
	{
		return ( this.Get( _file, _section, _key ) == this.KEY_NOT_FOUND ) ? false : true
	}
}