;;
;; AcecoolAHK_Framework Minimal-Loader - Loads only the most basic files in order to run a job / process - Josh 'Acecool' Moser
;;


;;
;; Script Config - May export this to a script config ahk file which can be included ( so it isn't repeated for framework launcher and run framework base )...
;;

;; Enable warnings to assist with detecting common errors.
; #Warn

;; Automatically trim trailing and beginning spaces from strings?
AutoTrim, Off

;; Disable single-instance ( For Jobs / Processes ) so this base can be included before the process code is executed...
#SingleInstance off

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
Menu, Tray, Icon, _assets\icons\favicon.ico


;;
;; Base includes...
;;
#include _assets\__load_order_files__\_loader_base_.ahk