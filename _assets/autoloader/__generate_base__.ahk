﻿;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Set the working directory to be that of my AHK Scripts folder for easy includes...
;; As these file generators may be executed independently of the loader, set up the paths ( this may change to simplify things )
;;


;; Menu Icon...
Menu, Tray, Icon, _assets\icons\favicon_r270deg.ico


;;
;; Include the AutoLoader Function List
;;
#include  classes\library_ahk.ahk
#include  classes\library_autoloader.ahk
#include  classes\library_config.ahk
#include  classes\library_debug.ahk
#include  classes\library_file.ahk
#include  classes\library_ini.ahk
#include  classes\library_input.ahk
#include  classes\library_julian_date.ahk
#include  classes\library_logic.ahk
#include  classes\library_math.ahk
#include  classes\library_nircmd.ahk
#include  classes\library_notify.ahk
#include  classes\library_string.ahk
#include  classes\library_time.ahk
#include  classes\library_util.ahk
#include  classes\library_version.ahk
#include  classes\library_window.ahk
#include  _assets\autoloader\__acecoolahk_framework_autoloader__.ahk


;;
;; Generate the file to load the framework base ( only base files such as definitions, functions, classes, etc... )
;;

;; Create folder if it doesn't exist..
file.CreateFolderIfNotExists( "_assets\__load_order_files__\" )

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