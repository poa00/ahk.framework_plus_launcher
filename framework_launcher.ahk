;;
;; File which loads the Full AcecoolAHK_Framework - Josh 'Acecool' Moser
;;


;;
;; Script Config - May export this to a script config ahk file which can be included ( so it isn't repeated for framework launcher and run framework base )...
;;

;; Enable warnings to assist with detecting common errors.
; #Warn

;; Automatically trim trailing and beginning spaces from strings?
AutoTrim, Off

;; Enable single-instance to ensure only 1 framework launcher is running at any given time...
#SingleInstance On

;; Persist..
#Persistent

;; DEFAULT: Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv

;; Allow hotkeys to run in additional threads / windows..
#MaxThreadsPerHotkey 10

;; Recommended for new scripts due to its superior speed and reliability.
SendMode Input

;; Keyboard and Mouse Hook
#InstallKeybdHook
#InstallMouseHook


;;
;; Set the working directory to be that of my AHK Scripts folder for easy includes...
;;

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework

;; Normally isn't needed with a properly formulated SetWorkingDir; using it because of compatibility issues...
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework

;; Set the default tray icon... eg: Menu, Tray, Icon, shell32.dll, 44 ;; Favorites Star
Menu, Tray, Icon, _assets\icons\favicon_r180deg.ico


;;
;; Define the Launch Commands ( Build base file, Build full file, launch full-loader )
;;
__framework_launch_commands__=
(join&
	__generate_base__.ahk
	__generate_full__.ahk
	run_framework_full.ahk
)

;; Run each command in cmd.exe with the last being run_framework_full.ahk which loads all of the framework back-end and hotkeys, etc..
;; The downside to this method is the cmd.exe and cmdhost.exe will remain running for the duration of the script. It will close on script
;; end, and it is possible to exit the cmd.exe but it doesn't seem easily doable to be reliable enough on all client systems.. therefore I
;; leave it running...
run, %comspec% /c %__framework_launch_commands__%,,Hide,__cmd

;; Exit the framework_launcher.ahk script so there isn't an upside down A in the tray for the duration of this framework being loaded...
ExitApp