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
	;; Remove INI File Entry...
	;;
	Delete( _section, _key )
	{
		return ini.Delete( this.__FILE__, _section, _key )
	}



	;;
	;; Adds a comment to the file above a key so the user knows values they can use, etc...
	;;
	SetComment( _section, _key, _value )
	{
		;;
		return ini.SetComment( this.__FILE__, _section, _key, _value )
	}


	;;
	;; Remove INI Comment Entry...
	;;
	DeleteComment( _section, _key )
	{
		return ini.DeleteComment( this.__FILE__, _section, _key )
	}

	;;
	;; Creates the file if it doesn't exist and adds some default values...
	;;
	InitConfigFile( )
	{
		;; If the config.ini file doesn't exist.. create it... and add a few "example" 
		file.CreateIfNotExists( this.__FILE__ )

		;; Set the default example keys - file-name...
		this.SetDefault( "AcecoolAHK_Framework", "__this__", this.__FILE__ )
		this.SetComment( "AcecoolAHK_Framework", "__this__", "Example Configuration Key - __this__ is the current files filename..." )

		this.SetDefault( "AcecoolAHK_Framework", "Author", "Josh 'Acecool' Moser" )
		this.SetComment( "AcecoolAHK_Framework", "Author", "The primary developer behind AcecoolAHK_Framework - There is an honorable mention for used code whether or not it is to comply with licenses as credit is given where due!" )

		this.SetDefault( "AcecoolAHK_Framework", "Website", "https://bitbucket.org/Acecool/acecoolahk_framework" )
		this.SetComment( "AcecoolAHK_Framework", "Website", "The Authors Website - Currently it is set to the Framework Bitbucket page.. This will change soon!" )

		this.SetDefault( "AcecoolAHK_Framework", "Repo", "https://bitbucket.org/Acecool/acecoolahk_framework" )
		this.SetComment( "AcecoolAHK_Framework", "Repo", "The Repository for the framework which is used by the auto-updater and other modules or systems." )
	}
}