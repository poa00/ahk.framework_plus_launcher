;;
;; AcecoolAHK_Framework Everything-loader - This is the script which loads everything and remains running in the background - Josh 'Acecool' Moser
;;


;;
;; Config
;;
;; Note: Base config should be handled in run_framework_base.ahk as that is loaded prior to this...
;;


;;
;; Set the working directory to be that of my AHK Scripts folder for easy includes...
;; Note: This file can be launched by itself, or through the launcher. I'd recommend simply using the launcher, but running this script directly
;;	is no different than using Tray > Reload This Script... except single-instance isn't forced if you run this again...
;;

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_ScriptDir%\..\..\

;; Normally isn't needed with a properly formulated SetWorkingDir; using it because of compatibility issues...
#include %A_ScriptDir%\..\..\

;;
;; Run the base framework then run the full-framework extras...
;;
#include _assets\autoloader\run_framework_base.ahk
#include _assets\__load_order_files__\_loader_full_.ahk