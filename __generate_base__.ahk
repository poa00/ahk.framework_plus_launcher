;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; As these file generators may be executed independently of the loader, set up the paths ( this may change to simplify things )
;;
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

;; Menu Icon...
Menu, Tray, Icon, _assets\icons\favicon_r270deg.ico


;;
;; Include the AutoLoader Function List
;;
#include  __acecoolahk_framework_autoloader__.ahk


;;
;; Generate the file to load the framework base ( only base files such as definitions, functions, classes, etc... )
;;

;; Identify the active file to use and clear it...
AutoLoader_ResetLoader( "loader_base" )

;; Read all definition files into inclusion list
AutoLoader_ReadFiles( "definitions" )

;; Read all classes into inclusion list
AutoLoader_ReadFiles( "classes" )

;; Read all functions into inclusion list
AutoLoader_ReadFiles( "functions" )

;; Finish up with load_order.ahk
AutoLoader_Finish( )