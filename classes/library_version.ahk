;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;
; version.example( )



;;
;; Variables, CONSTants, ENUMerations, etc..
;;
class version
{
	;;
	;;
	;;
	static VERSION_NO_CHANGE := 0
	static VERSION_NEW_BUILD := 1
	static VERSION_NEW_MINOR := 2
	static VERSION_NEW_MAJOR := 4


	;;
	;;
	;;
	example( )
	{
		
	}


	;;
	;; Compares 2 versions
	;;
	Compare( _local, _other )
	{
		_change := this.VERSION_NO_CHANGE

		StringSplit, _local_split, _local, "."
		_local_major := _local_split[ 1 ]
		_local_minor := _local_split[ 2 ]
		_local_build := _local_split[ 3 ]

		StringSplit, _other_split, _other, "."
		_other_major := _other_split[ 1 ]
		_other_minor := _other_split[ 2 ]
		_other_build := _other_split[ 3 ]

		if ( _local_build < _other_build )
			_change := _change + this.VERSION_NEW_BUILD

		if ( _local_minor < _other_minor )
			_change := _change + this.VERSION_NEW_MINOR

		if ( _local_major < _other_major )
			_change := _change + this.VERSION_NEW_MAJOR

		return _change
	}


	;;
	;; Reads the local version from version.txt or returns a default version...
	;;
	GetFile( )
	{
		return file.Read( "version.txt", "0.0.0" )
	}


	;;
	;;
	;;
	GetConfig( )
	{
		return config.Get( "__Versioning", "version", "0.0.0" )
	}


	;;
	;;
	;;
	SetConfig( _version )
	{
		return config.Set( "__Versioning", "version", _version )
	}


	;;
	;;
	;;
	GetLastChangelogConfig( )
	{
		return config.Get( "__Versioning", "changelog_version_read", "0.0.0" )
	}


	;;
	;;
	;;
	SetLastChangelogConfig( _version )
	{
		return config.Set( "__Versioning", "changelog_version_read", _version )
	}


	;;
	;;
	;;
	; GetChangeLogConfig( )
	; {
	; 	return config.Get( "__Versioning", "changelog", "0.0.0" )
	; }


	;;
	;;
	;;
	; SetChangeLogConfig( _version )
	; {
	; 	return config.Set( "__Versioning", "version", _version )
	; }


	;;
	;; Reads the version on the Repository site...
	;;
	GetRepo( )
	{
		file.ReadFromInternet( "https://bitbucket.org/Acecool/acecoolahk_framework/raw/master/version.txt" )
	}
}