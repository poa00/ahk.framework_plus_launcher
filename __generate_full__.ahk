;;
;; AutoHotkey Main-Loader - Josh 'Acecool' Moser
;;


;;
;; As these file generators may be executed independently of the loader, set up the paths ( this may change to simplify things )
;;
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

;; Menu Icon...
Menu, Tray, Icon, _assets\icons\favicon_r90deg.ico


;;
;; Include the AutoLoader Function List
;;
#include  __acecoolahk_framework_autoloader__.ahk


;;
;; Generate the file to load all of the extras ( on top of the base, ie only the differences between base and full )
;;

;; Identify the active file to use and clear it...
AutoLoader_ResetLoader( "loader_full" )

;; Read all modules \ addons into inclusion list ( These are stand-alone hotkey systems that I want to run when I run AHK such as
;; the DOpus Middle Click system )... the second argument true tells the loader to force the script to run as different instant and
;; will not use the framework base - these are 100% stand-alone scripts... I may create another load mode and change the second arg
;; to use ENUMeration instead of a boolean switch which would allow running a stand-alone script with the base on top vs 100% stand-
;; -alone vs including the file ( no argument / default )... For now this is fine, not to mention having many stand-alone scripts
;; redundantly including the base could be done better ( such as having the base hotkeys included with the rest of the framework and
;; then having the hotkey launch the special task which is how I run the Screenshot system - also included with this framework as an example )
;;
;; NOTE: As long as there are no files #include'd prior to the "run" commands, this works.. and because base and full load-orders are separate files, this
;;	should work flawlessly for now...
;;
AutoLoader_ReadFiles( "addons", true )

;; Read all hotkeys into inclusion list
AutoLoader_ReadFiles( "hotkeys" )

;; Finish up with the load order file...
AutoLoader_Finish( )