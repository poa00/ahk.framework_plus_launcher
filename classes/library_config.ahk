;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Default Framework Config / Data....
;;
OnInit_library_config( )
{
	;; I had this in __New but I don't want to have to create a new instance each time to check so this will act as a library...
	this.InitConfigFile( )

	;; Set up default config data for the Framework - Exists here because I haven't moved it elsewhere yet...
	config.SetDefault( "AcecoolAHK_Framework", "__this__", "config.ini" )
	config.SetDefault( "AcecoolAHK_Framework", "Author", "Josh 'Acecool' Moser" )
	config.SetDefault( "AcecoolAHK_Framework", "Website", "https://bitbucket.org/Acecool/acecoolahk_framework" )
}


;;
;; Configuration Class
;; TODO: Merge this into the ini class ( or simply extend it; rewrite ini to have filename as last arg so I can use Setter to set working file or something.. )
;;
class config
{
	;;
	;; Variables
	;;

	;; Internal variable notating the filename / path for our configuration data...
	static __FILE__ := "config.ini"


	;;
	;; Reads a Keys Value - Default is KEY_NOT_FOUND for error checking although support for default value will be available soon...
	;;
	Get( _section, _key )
	{
		return ini.Get( this.__FILE__, _section, _key )
	}


	;;
	;; Sets a Keys' Value
	;;
	Set( _section, _key, _value )
	{
		;;
		return ini.Set( this.__FILE__, _section, _key, _value )
	}


	;;
	;; Sets a Key / Value only if said Key / Value doesn't exist... ie Init Only..
	;;
	SetDefault( _section, _key, _value )
	{
		return ini.SetDefault( this.__FILE__, _section, _key, _value )
	}


	;;
	;;
	;;
	Delete( _section, _key )
	{
		; debug.print( "Removing config key / value: " . _section . " / key: " . _key )
		return ini.Delete( this.__FILE__, _section, _key )
	}


	;;
	;; Creates the file if it doesn't exist and adds some default values...
	;;
	InitConfigFile( )
	{
		;; If the config.ini file doesn't exist.. create it...
		if ( file.IfNotExist( this.__FILE__ ) )
		{
			file.Create( this.__FILE__ )
			this.SetDefault( "AcecoolAHK_Framework", "__this__", this.__FILE__ )
			this.SetDefault( "AcecoolAHK_Framework", "Author", "Josh 'Acecool' Moser" )
			this.SetDefault( "AcecoolAHK_Framework", "Website", "https://bitbucket.org/Acecool/acecoolahk_framework" )
		}
	}
}