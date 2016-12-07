;;
;; AcecoolAHK_Framework Everything-loader - This is the script which loads everything and remains running in the background - Josh 'Acecool' Moser
;;

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\


;;
;; Variables, CONSTants, ENUMerations, etc..
;;

;; Load the base framework stuff such as definitions, etc ( It also includes the autoloader )...
; #include __acecoolahk_framework_autoloader__.ahk
#include __acecoolahk_framework_loader_base__.ahk

;;
;;
;;


RunWait __full__.ahk

;; Now load it...
; sleep 250
; FileIO_Append( _loader_full_.ahk, "" )
; while ! IfExists( AutoLoader_ActiveLoaderFile( ) )
	; sleep 250

; #include _loader_full_.ahk
; #include _assets\_autoloader\loader_full.ahk

#include _loader_full_.ahk
; while true
; {
	; IfExist, AutoLoader_ActiveLoaderFile( )
	; {
		; #include _loader_full_.ahk
		; break
	; }
	; else
	; {
		; sleep 250
	; }
; }



;; Read all definition files into inclusion list
; AutoLoader_ReadFiles( "definitions" )

;; Read all classes into inclusion list
; AutoLoader_ReadFiles( "classes" )

;; Read all functions into inclusion list
; AutoLoader_ReadFiles( "functions" )

;; Libraries are loaded automatically via scripts that use them
; AutoLoader_ReadFiles( "libraries" )

;; Read all processes into inclusion list ( or maybe not.. I will need to read them for the gui I have planned, but these should
;;	be loaded like classes.. when scripts need them. )
; AutoLoader_ReadFiles( "processes" )