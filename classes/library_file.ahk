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
	Read( _file, _default := "" )
	{
		;; If the file exists, read it...
		if ( this.Exists( _file ) )
		{
			FileRead, _data, %_file%

			return _data
		}

		;; If the file doesn't exist, we can optionally return a default value...
		if ( _default != "" )
			return _default

		;; If no default value was given and the file doesn't exist.. return false..
		return false
	}


	;;
	;; https://autohotkey.com/docs/commands/URLDownloadToFile.htm
	;;
	ReadFromInternet( _url := "https://bitbucket.org/Acecool/acecoolahk_framework/raw/master/version.txt" )
	{
		; Example: Download text to a variable:
		_request := ComObjCreate( "WinHttp.WinHttpRequest.5.1" )
		_request.Open( "GET", _url, false )
		_request.Send( )

		; Using 'true' above and the call below allows the script to remain responsive.
		_request.WaitForResponse( )
		_data := _request.ResponseText
		MsgBox % version
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
	;; Appends _data to _file
	;;
	Append( _file, _data := "" )
	{
		FileAppend %_path% %_data%
	}


	;;
	;; Creates a blank file ( or appends nothing )
	;;
	Create( _file, _data := "" )
	{
		return this.Append( _file, _data )
	}


	;;
	;; Creates a file if it doesn't exist...
	;;
	CreateIfNotExists( _file, _data := "" )
	{
		if ( this.NotExists( _file ) )
		{
			file.Create( _file )

			if ( _data != "" )
				this.Append( _file, _data )

			return true
		}

		return false
	}


	;;
	;; Creates a folder if it doesn't exist...
	;;
	CreateFolderIfNotExists( _name )
	{
		if ( this.NotExists( _name ) )
			FileCreateDir, %_name%
	}
}