;;
;; This is an example of what the automatically generated AutoHotkey Script should look like if it is to - Josh 'Acecool' Moser
;;	load the framework files from: C:\Users\%UserName%\Dropbox\AcecoolAHK_Framework\run_framework_full.ahk
;;

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework

;; Normally isn't needed with a properly formulated SetWorkingDir; using it because of compatibility issues...
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework

;; Set a favicon so we know which script we're using and the load progress..
Menu, Tray, Icon, _assets\icons\favicon_r90deg.ico

;; Include the autoloader
#include run_framework_full.ahk
