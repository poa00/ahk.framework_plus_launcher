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
;;
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\


;;
;; Run the base framework then run the full-framework extras...
;;
#include run_framework_base.ahk
#include *i _loader_full_.ahk