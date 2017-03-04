


;; Callback for the Toast / Balloon Notification - Opens the photo and path on click...
;;
;; https://autohotkey.com/docs/commands/OnMessage.htm
;; https://autohotkey.com/boards/viewtopic.php?f=5&t=19778&p=95185#p95185
;;
Toast_Callback_Help( wParam, lParam, msg, hwnd )
{
	;;
	SetWorkingDir, %A_AppData%\..\..\Dropbox\AcecoolAHK_Framework\

	;; If this doesn't belong with this instance, quit...
	; if ( hwnd != A_ScriptHwnd )
		; return false

	;; The notification was clicked, open the image... and exit the app since the notification will be gone too...
	if ( lParam = 1029 ) ; NIN_BALLOONUSERCLICK
	{
		;; Tell the user what we're doing...
		; _text :=  ; saved in: " A_UserName ", Dropbox, Screenshots."
		; run "..\..\OneDrive\Apps\NirCMD\nircmd.exe" speak text "Opening help"
		nircmd.TextToSpeech( "Opening Help!" )

		;; Launch the help document...
		; run _assets\acecool_help.html

		OnMessage( 0x404, "" )		
	}

	; return true
}