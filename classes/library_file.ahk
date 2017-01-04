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
	;;
	;;
	IfExist( _file )
	{
		IfExist, %_file%
			return true

		return false
	}


	;;
	;; Alias...
	;;
	Exists( _file )
	{
		return this.IfExist( _file )
	}


	;;
	;;
	;;
	IfNotExist( _file )
	{
		return !this.IfExist( _file )
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