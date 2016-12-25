;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;;
;;
global CONFIGURATION_FILE
CONFIGURATION_FILE:="config.ini"

;;
;; Configuration Class
;;
class configuration
{
	;;
	;; Variables
	;;
	; __filename:="config.ini"


	;;
	;; On Initialization
	;;
	__New( )
	{
		print( "Config > Init / __New" )

	}


	;;
	;; The Config Filename...
	;;
	GetFilename( )
	{
		return CONFIGURATION_FILE ;this.__filename
	}


	;;
	;; Reads a Keys Value - Default is KEY_NOT_FOUND for error checking although support for default value will be available soon...
	;;
	ReadValue( _section, _key )
	{
		;; I had this in __New but I don't want to have to create a new instance each time to check so this will act as a library...
		this.CreateConfigFileIfNotExists( )

		; __filename := this.GetFilename( )
		IniRead, _return, config.ini, %_section%, %_key%, KEY_NOT_FOUND
		print( "Config > ReadValue > From File: > '" CONFIGURATION_FILE "' Section: '" _section "' > Key: '" _key "' Value: '" _return "'" )

		return _return
	}


	;;
	;; Checks to see if a Key Exists...
	;;
	KeyExists( _section, _key )
	{
		; __filename := this.GetFilename( )
		_return := this.ReadValue( _section, _key )
		return ( _return=="KEY_NOT_FOUND" ) ? false : _return
	}


	;;
	;; Sets a Keys' Value
	;;
	SetValue( _section, _key, _value )
	{
		;; I had this in __New but I don't want to have to create a new instance each time to check so this will act as a library...
		this.CreateConfigFileIfNotExists( )

		; __filename:=this.GetFilename( )
		;;IniWrite, Value, Filename, Section, Key
		IniWrite, %_value%, config.ini, %_section%, %_key%

		print( "Config > SetValue > Into File: > '" CONFIGURATION_FILE "' Section: '" _section "' > Key: '" _key "' Value: '" _value "'" )
	}


	;;
	;; Sets a Key / Value only if said Key / Value doesn't exist... ie Init Only..
	;;
	SetDefaultValue( _section, _key, _value )
	{
		print( "SetDefaultValue( " . _section . ", " . _key . ", " . _value . " )" )
		if ( !this.KeyExists( _section, _key ) )
			this.SetValue( _section, _key, _value )
	}


	;;
	;; Checks to see if the Configuration File Exists...
	;;
	ConfigFileExists( )
	{
		; __filename:=this.__filename
		ifExist, %CONFIGURATION_FILE%
		{
			print( "Configuration File Exists!" )
			return true
		}
		else
		{
			print( "Configuration File Doesn't Exist!" )
			return false
		}
	}


	;;
	;; Creates the file if it doesn't exist and adds some default values...
	;;
	CreateConfigFileIfNotExists( )
	{
		;; If the config.ini file doesn't exist.. create it...
		if ( !this.ConfigFileExists( ) )
		{
			FileAppend,, config.ini
			;; this.SetValue( "AcecoolAHK_Framework", "__this__", "config.ini" )
			this.SetValue( "AcecoolAHK_Framework", "Author", "Josh 'Acecool' Moser" )
			this.SetValue( "AcecoolAHK_Framework", "Website", "https://bitbucket.org/Acecool/acecoolahk_framework" )
		}
	}


	;;
	;;
	;;
	; CreateFilse( )
	; {
	
	; }

	;;
	;;
	;;
	; Save( )
	; {
	
	; }
}