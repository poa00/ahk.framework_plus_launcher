;;
;; AcecoolAHK_Framework Minimal-Loader - Loads only the most basic files in order to run a job / process - Josh 'Acecool' Moser
;;

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

;; Disable single-instance ( For Jobs / Processes )
#SingleInstance off

;;
#Persistent

;; DEFAULT: Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv

;; Enable warnings to assist with detecting common errors.
; #Warn

;; Recommended for new scripts due to its superior speed and reliability.
SendMode Input

;; Set the default tray icon ( Can only be set 1 time?? )... eg: Menu, Tray, Icon, shell32.dll, 44 ;; Favorites Star
Menu, Tray, Icon, _assets\icons\favicon.ico

;; Allow hotkeys to run in additional threads / windows..
#MaxThreadsPerHotkey 10

;;
#InstallKeybdHook
#InstallMouseHook

;;
; AutoTrim, Off

;;
;; Base includes...
;;

;; Include the Autoloader so we can include everything we need...
; #include  __acecoolahk_framework_autoloader__.ahk

RunWait __base__.ahk

		#include _loader_base_.ahk

;; Now load it...
; FileIO_Append( _loader_base_.ahk, "" )
; while ! FileExist( AutoLoader_ActiveLoaderFile( ) )
	; sleep 250
; while true
; {
	; IfExist, AutoLoader_ActiveLoaderFile( )
	; {
		; break
	; }
	; else
	; {
		; sleep 250
	; }
; }
; #include _assets/_autoloader/loader_base.ahk
; #include _assets/_autoloader/load_order.ahk
