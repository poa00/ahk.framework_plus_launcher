﻿;;
;; AutoHotkey Main-Loader - Josh 'Acecool' Moser
;;


;;
;; Set the working directory to be that of my AHK Scripts folder for easy includes...
;; As these file generators may be executed independently of the loader, set up the paths ( this may change to simplify things )
;;


;; Menu Icon...
Menu, Tray, Icon, _assets\icons\favicon_r90deg.ico


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
;; Generate the file to load all of the extras ( on top of the base, ie only the differences between base and full )
;;

;; Identify the active file to use and clear it...
AutoLoader_ResetLoader( "loader_full" )



; ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !
; ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !

;;
;; Enabling this directory to dynamically load all files contained within is to be done at your own risk!!! It will run shortcuts to files, it will run executables,
;;	it will run bat files, ahk files, etc.. EVERYTHING!!! Even scripts to format your hard-drive... This feature is here for those of you that want to have the
;;	framework load up other useful apps on startup ( such as RestartOnCrash, SysInternals ProcessExplorer, Other Portable Apps, Compiled AHK Scripts, and more )..
;;
;; The one form of protection I do add is to create a MessageBox question / popup for each file in the directory when the framework is generating the load-order
;;	files. It will tell you the name of the file and if you wish to include it in the run-catalog. Yes to add it, no to skip it. You can disable this messagebox
;;	deal by uncommenting the line with 2 trues.. To enable it, uncomment the line with 3 trues...
;;

;; Uncomment the line directly below this comment to enable the exe folder and to include everything blindly...
; AutoLoader_ReadFiles( "addons_exe", true, true, true )

;; Uncomment the line directly below this comment to enable the exe folder and to be asked about each file to include...
AutoLoader_ReadFiles( "addons_exe", true, true )

;;
;; DO NOT UNCOMMENT BOTH LINES.. ONLY UNCOMMENT 1 LINE IF ANY!!!!
;;

; ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !
; ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !



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

;; Addon Scripts that should be executed as separate instances - Stand-Alone scripts such as Columbus App Launcher, Radial Menus, etc...
;; Basically for standalone scripts that have everything ( functions, hotkeys, whatever.. etc.. ) but which should be run as a separate
;; instance because it may also have tray menus, etc... or was simply designed to be executed individually instead of as part of a collective..
AutoLoader_ReadFiles( "addons_run", true )


;; Addon Scripts that should be included as a drag and drop file which has everything ( functions, hotkeys, etc.. or whatever.. )
AutoLoader_ReadFiles( "addons_inc" )

;; Important core-related files that launch other processes, etc...
AutoLoader_ReadFiles( "modules" )

;; Visual Stuff when it comes..
AutoLoader_ReadFiles( "vgui" )


;; Read all hotkeys into inclusion list
AutoLoader_ReadFiles( "hotkeys" )

;; Read all hooks / callbacks into inclusion list
AutoLoader_ReadFiles( "hooks" )


;; Finish up with the load order file...
AutoLoader_Finish( )