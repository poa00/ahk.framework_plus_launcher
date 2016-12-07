;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;

SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

;; Include globals before anything else... Include default PC Settings ( Numlock always on, etc.. )
; #include __definitions.ahk

;; Include the libraries
; #include __libraries.ahk

;; Include the functions library
; #include __callbacks.ahk

;; Include the functions library
; #include __functions.ahk


;;
;;
;;
#include  __acecoolahk_framework_autoloader__.ahk
AutoLoader_ResetLoader( "loader_base" )
; AutoLoader_ResetLoader( "load_order" )


;;
;;
;;

;; Read all definition files into inclusion list
AutoLoader_ReadFiles( "definitions" )

;; Read all classes into inclusion list
AutoLoader_ReadFiles( "classes" )

;; Read all functions into inclusion list
AutoLoader_ReadFiles( "functions" )

;; Libraries are loaded automatically via scripts that use them
; AutoLoader_ReadFiles( "libraries" )

;; Read all hotkeys into inclusion list
; AutoLoader_ReadFiles( "hotkeys" )

;; Read all processes into inclusion list ( or maybe not.. I will need to read them for the gui I have planned, but these should
;;	be loaded like classes.. when scripts need them. )
; AutoLoader_ReadFiles( "processes" )

;; Read all modules / addons into inclusion list ( These are stand-alone hotkey systems that I want to run when I run AHK such as
;; the DOpus Middle Click system )...
; AutoLoader_ReadFiles( "addons", true )


;; Finish up with load_order.ahk
AutoLoader_Finish( )