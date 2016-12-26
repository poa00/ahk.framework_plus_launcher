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


;; Set the default tray icon... eg: Menu, Tray, Icon, shell32.dll, 44 ;; Favorites Star
Menu, Tray, Icon, _assets\icons\favicon_r180deg.ico


;;
;; Check to see whether this is the first-load or not... Do we need to build the load-order? If so, no point in asking the user what to do...
;;
_rebuild:=true
IfExist _assets\__load_order_files__\_loader_full_.ahk
	_rebuild:=false


;;
;; Ask the user if they want to refresh the load-order
;;
if !_rebuild
	MsgBox, 4, AcecoolAHK_Framework - Skip Rebuilding Database?, Do you want to launch the Framework without rebuilding the files-to-execute-list? Yes to Run as is.. No to Rebuild which files the Framework will load and then Run..

;; If the user wants to rebuild, then we rebuild our load-order
IfMsgBox No
	_rebuild:=true


;;
;; Rebuild our Load Order...
;;
if _rebuild
{
	;; Run each command in cmd.exe with the last being run_framework_full.ahk which loads all of the framework back-end and hotkeys, etc..
	;; The downside to this method is the cmd.exe and cmdhost.exe will remain running for the duration of the script. It will close on script
	;; end, and it is possible to exit the cmd.exe but it doesn't seem easily doable to be reliable enough on all client systems.. therefore I
	;; leave it running...
	__framework_launch_commands__=
	(join&
		_assets\autoloader\__generate_base__.ahk
		_assets\autoloader\__generate_full__.ahk
	)

	;; Since generating the load order actually ends with the ahk file closing, we can use Process Close to prevent this cmd.exe from remaining open.
	RunWait, %comspec% /c %__framework_launch_commands__%,,Hide,__cmd
	Process, Close, %__cmd%
}


;;
;; Define the Launch Commands ( Build base file, Build full file, launch full-loader )
;; This cmd.exe will remain open until the framework is closed.. unfortunately...
;;
Run, %comspec% /c _assets\autoloader\run_framework_full.ahk,,Hide,__cmd


;; Exit the framework_launcher.ahk script so there isn't an upside down A in the tray for the duration of this framework being loaded...
ExitApp