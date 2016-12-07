;;
;; AutoHotkey Main-Loader - Josh 'Acecool' Moser
;;

SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

;;
;; Normal Includes ( BASE + HotKeys )
;;
#include  __acecoolahk_framework_autoloader__.ahk



;;
;; Setup the AutoLoader to load files under the ID loader_full ( so base file can be included first then full without rewriting same file )
;;
AutoLoader_ResetLoader( "loader_full" )


;;
;;
;;

;; Read all hotkeys into inclusion list
AutoLoader_ReadFiles( "hotkeys" )

;; Read all modules \ addons into inclusion list ( These are stand-alone hotkey systems that I want to run when I run AHK such as
;; the DOpus Middle Click system )...
AutoLoader_ReadFiles( "addons", true )

;; Finish up with load_order.ahk
AutoLoader_Finish( )