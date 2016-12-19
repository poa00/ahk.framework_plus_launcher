;;
;; Screenshot Job - Josh 'Acecool' Moser
;;


;;
;; Config
;;
global DROPBOX_LINK
https://dl.dropboxusercontent.com/u/26074909/Public/Screenshots/notepad++_screenshot_20161219115235_4529.png

;;
;; Public DropBox Link - replace XXXXX with your number / id ( Right click something in your public folder > Copy Public Link > Paste it below after HERE: 
;; HERE:
;; Now after /u/ copy the numbers up to / and replace XXXXXX below with that number...
;;
DROPBOX_LINK = https://dl.dropboxusercontent.com/u/XXXXXX


;;
;; Set the working directory to be that of my AHK Scripts folder for easy includes...
;;

;; Set the working directory to be that of my AHK Scripts folder for easy includes...
SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework

;; Normally isn't needed with a properly formulated SetWorkingDir; using it because of compatibility issues...
#include %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework

;; Include the base functions library, and base settings for processes...
#include _assets\autoloader\run_framework_base.ahk

;; Set the tray icon... Example: Menu, Tray, Icon, _assets\favicon.ico
Menu, Tray, Icon, imageres.dll, 68

;; Path to Screenshots Directory; can use full-path or from working dir
_path := A_AppData . "\..\..\Dropbox\Screenshots\"


;;
;; Callback for the Toast / Balloon Notification - Opens the photo and path on click... We define this in our stand-alone process
;; so it doesn't get used for something else when we don't want it to...
;;
;; https://autohotkey.com/docs/commands/OnMessage.htm
;; https://autohotkey.com/boards/viewtopic.php?f=5&t=19778&p=95185#p95185
;;
Toast_Callback_Screenshot( wParam, lParam, msg, hwnd )
{
	;; We need to reference 2 locals outside of this function, inside this function... Unfortunately we need to do this... or do we??
	global _name
	global _path

	;; If this doesn't belong with this instance, quit...
	if ( hwnd != A_ScriptHwnd )
		return false

	;; The notification was clicked, open the image... and exit the app since the notification will be gone too...
	if ( lParam = 1029 ) ; NIN_BALLOONUSERCLICK
	{
		MsgBox, 4,, Do you want to make the photo public ( Move to Dropbox\Public\Screenshots\ ) or not ( Keep in Dropbox\Screenshots\ )?
		IfMsgBox Yes
		{
			; Move the Screenshot from Private to Public Screenshots Directory...
			RunWait, %comspec% /c move "%_path%%_name%" "%_path%..\Public\Screenshots\",,Hide,__cmd

			;; Close the command prompt after it has moved the file...
			Process, Close, __cmd

			;; Open the file...
			run %_path%..\Public\Screenshots\%_name%

			;; Copy the public link to the clipboard..
			;; TODO: URLENCODE the name ( To support spaces, etc.. just in case I change the string_safe function )...
			Clipboard = %DROPBOX_LINK%/Screenshots/%_name%
		}
		IfMsgBox No
		{
			; Open the file...
			run %_path%%_name%
		} 
		
		ExitApp
	}

	;; The notification timed out and disappeared from the notification list; we don't need the app open any longer because the notification is gone...
	if ( lParam = 1028 ) ; NIN_BALLOONTIMEOUT - Notification timed out or was closed or right-clicked.
		ExitApp
}


;;
;; Execute the process / Job... ie take the screenshot, save it and add the callback hook.. Allow this to run until the callback closes it...
;;
	;; Reset the working dir so a clean path is output ( Instead of Appdata .. .. Dropbox.... )
	;; TODO: Write auto-loader for Environment Variables to AHK Variable Initialization; these won't work for includes but should work for output... Then I can just use %Dropbox%
	; SetWorkingDir, %A_AppData%\..\..\

	;; Usable space within the area...
	; screen := "0|0|" . A_ScreenWidth . "|" . A_ScreenHeight ; X|Y|W|H

	;; Parse the string to create a safe but concise name for the photo
	; _name := Screenshot( _path, screen )
	_name := ScreenshotName( )
	run "_assets\bin\NirCmd_x64\nircmd.exe" savescreenshotwin %_path%%_name%

	;; Hook into the toast / callback...
	OnMessage( 0x404, Func( "Toast_Callback_Screenshot" ) )

	;; Notify the user
	;; TODO: Add OnClick process / job which opens Windows photo viewer, then, onclose, asks if the photo should be moved to public/Screenshots/ ( Subfolder? ) and copy public link...
	TrayTip, ScreenShot Captured, "%_path%%_name%" Saved!

	;; Speech
	; _text := "Screenshot Captured and has been saved to: " A_UserName ", Dropbox, Screenshots.. Click the tray-notification to view the file."
	; run "OneDrive\Apps\NirCMD\nircmd.exe" speak text "%_text%"
return