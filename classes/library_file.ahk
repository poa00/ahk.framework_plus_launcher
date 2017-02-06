;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
; fileio.example( )


;;
;; File Input / Output Library
;;
class file
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{

	}


	;;
	;; Determines whether or not a file or folder exists... Returns true if yes, false if not..
	;;
	IfExist( _file )
	{
		IfExist, %_file%
			return true

		return false
	}


	;;
	;; Determines whether or not a file or folder exists... Returns true if not, false if yes..
	;;
	IfNotExist( _file )
	{
		return !this.Exists( _file )
	}


	;;
	;; Alias of IfExist..
	;;
	Exists( _file )
	{
		return this.IfExist( _file )
	}


	;;
	;; Alias of IfNotExist..
	;;
	NotExists( _file )
	{
		return !this.Exists( _file )
	}


	;;
	;; Creates a folder if it doesn't exist...
	;;
	CreateFolderIfNotExists( _name )
	{
		if ( this.NotExists( _name ) )
			FileCreateDir, %_name%
	}


	;;
	;; Appends _data to _file
	;;
	Append( _file, _data )
	{
		FileAppend %_path% %_data%
	}


	;;
	;; Creates a blank file ( or appends nothing )
	;;
	Create( _file )
	{
		return this.Append( _file, "" )
	}
}