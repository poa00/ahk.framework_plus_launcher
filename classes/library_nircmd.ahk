;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Used for debugging - displays example of what this library can do...
;;
; nircmd.example( )


;;
;; These were not added for one reason or another...
;;
; Turn off all computers specified in computers.txt !	multiremote copy "c:\temp\computers.txt" exitwin poweroff force
; Dial to "My Internet" connection	nircmd.exe rasdial "My Internet"
; Disconnect the "My Internet" connection	nircmd.exe rashangup "My Internet"
; Make your Internet Explorer windows 75% transparent ! (192 / 256)	nircmd.exe win trans ititle "internet explorer" 192
; Close all your Explorer windows (My Computer, folders, and so on)	nircmd.exe win close class "CabinetWClass"
; Center all top-level windows	nircmd.exe win center alltop
; Remove the title bar of My Computer window.	nircmd.exe win -style title "my computer" 0x00C00000
; Return the title bar of My Computer window that we removed in the previous example.	nircmd.exe win +style title "my computer" 0x00C00000
; Set the My Computer window to right-to-left order (For hebrew and arabic languages)	nircmd win +exstyle title "my computer" 0x00400000
; Set all child windows of My Computer window to right-to-left order (For hebrew and arabic languages)	nircmd win child title "my computer" +exstyle all 0x00400000
; Create a shortcut on your desktop that closes all your Internet Explorer windows	nircmd.exe cmdshortcut " "~$folder.desktop$ "Close All IE" win close class "IEFrame"
; Create a shortcut on your desktop that hides all your Internet Explorer windows	nircmd.exe cmdshortcut " "~$folder.desktop$ "Hide All IE" win hide class "IEFrame"
; Create a shortcut on your desktop that shows back all your Internet Explorer windows	nircmd.exe cmdshortcut " "~$folder.desktop$ "Show All IE" win show class "IEFrame"
; Set the Windows Calculator as top-most window (above all other windows)	nircmd.exe win settopmost title "Calculator" 1
; Set the Windows Calculator back to regular window (non top-most window)	nircmd.exe win settopmost title "Calculator" 0
; Create a shortcut to Windows calculator under Start Menu->Programs->Calculators	nircmd.exe shortcut "f:\winnt\system32\calc.exe" "~$folder.programs$\Calculators" "Windows Calculator"
; Hide the desktop window	nircmd.exe win hide class progman
; Show the desktop window (After hiding it in previous example)	nircmd.exe win show class progman
; Hide the start button on the system tray	nircmd.exe win child class "Shell_TrayWnd" hide class "button"
; Show the start button on the system tray	nircmd.exe win child class "Shell_TrayWnd" show class "button"
; Hide the clock on the system tray	nircmd.exe win child class "Shell_TrayWnd" hide class "TrayClockWClass"
; Show the clock on the system tray	nircmd.exe win child class "Shell_TrayWnd" show class "TrayClockWClass"
; Kill (terminate) all instance of Internet Explorer processes	nircmd.exe killprocess iexplore.exe
; Create a shortcut on your desktop that opens the door of K: CDROM drive when you run it.	nircmd.exe cmdshortcut "~$folder.desktop$" "Open CDROM" cdrom open k:
; Create a shortcut to NirSoft Web site on your desktop	nircmd.exe urlshortcut "http://www.nirsoft.net" "~$folder.desktop$" "NirSoft"
; Add NirSoft Web site to your Favorities under Links folder.	nircmd.exe urlshortcut "http://www.nirsoft.net" "~$folder.favorites$\Links" "NirSoft"
; Create a shortcut to NirSoft Web site on the desktop of all computers listed in computers.txt	nircmd.exe multiremote copy "c:\temp\computers.txt" urlshortcut "http://www.nirsoft.net" "~$folder.common_desktop$" "NirSoft"
; Create a shortcut on the desktop that set the display mode to 800x600x24bit colors	nircmd.exe cmdshortcut "~$folder.desktop$" "800x600x24" setdisplay 800 600 24
; Copy all shortcuts on your desktop to another folder (f:\temp\desktop).	nircmd.exe execmd copy "~$folder.desktop$\*.lnk" f:\temp\desktop
; Restart your Apache server (under Windows NT/2000/XP/2003)	nircmd.exe service restart apache
; Create a shortcut on your desktop that restarts the Apache server	nircmd.exe cmdshortcut "~$folder.desktop$" "Restart Apache" service restart apache
; Restart your IIS	nircmd.exe service restart w3svc
; Restart MySql	nircmd.exe service restart MySql
; Open the Registry key that you copied to the clipboard in RegEdit.	nircmd regedit "~$clipboard$"
; Change the date/time of the specified filename (creation time and modified time)	nircmd.exe setfiletime "c:\temp\myfile.txt" "24-06-2003 17:57:11" "22-11-2005 10:21:56"
; Copy your desktop folder path to the clipboard	nircmd.exe clipboard set ~$folder.desktop$
; Copy your start menu folder path to the clipboard	nircmd.exe clipboard set ~$folder.start_menu$
; Copy the content of info1.txt (simple text file) to the clipboard	nircmd.exe clipboard readfile "c:\My Files\info1.txt"
; Add the text content of clipboard to info1.txt	nircmd.exe clipboard addfile "c:\My Files\info1.txt"
; Create all folders specified in "c:\temp\folders.txt". The folder path names are separated by CRLF characters.	nircmd.exe paramsfile "c:\temp\folders.txt" "" "" execmd md ~$fparam.1$
; Install the specified .NET assembly in the global assembly cache (like gacutil)	nircmd.exe gac install "C:\temp\MyAssembly\bin\MyAssembly.dll"
; Empty the recycle bin in all drives.	nircmd.exe emptybin
; Run RegEdit with SYSTEM user (On Windows 7/8/Vista/2008), which allows you to view all hidden system Registry keys	nircmd.exe elevatecmd runassystem c:\windows\regedit.exe


;;
;; Default / NirCMD Location / Path
;;
OnInit_library_nircmd( )
{
	config.SetDefault( "__BIN__", "NirCmd", "_assets\bin\NirCmd_x64\nircmd.exe" )
}


;;
;; NirCMD Library
;;
class nircmd
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		;; Grabs the current path to NirCmd ( from Config.ini )
		; this.path( )

		;; Helper function to call Run on NirCmd
		; this.Run( _args )

		;; Helper function to call RunWait on NirCmd
		; this.RunWait( _args )

		;; Clears the Clipboard
		; ClipboardClear( )

		;; Repeats a NirCmd action n times
		; Repeat( _action, _times )

		;; Sets the default audio and communication device
		; this.SetDefaultSoundDevice( _name )

		;; Converts text to audible speech
		; TextToSpeech( _text )

		;; Converts Clipboard Text to audible speech
		; ClipboardToSpeech( _text )
		; FileToSpeech( _path, _save_path:="C:\Temp\speak.wav" )
		; CreateShortcut( _path, _target )
		; CDRomOpen( _path )
		; CDRomClose( _path )
		; AudioSetVolume( _value:=65535 )
		; AudioModifyVolume( _value:=5000 )
		; AudioSetVolumeMax( _value:=65535 )
		; AudioIncreaseVolume( _value:=2000 )
		; AudioDecreaseVolume( _value:=-2000 )
		; AudioUnMute( )AudioMute( )
		; AudioToggleMute( )
		; AudioToggleMuteShortcut( )
		; MonitorOff( )
		; MonitorOn( )
		; ScreenSaver( )
		; ScreenSaverDisable( )
		; ScreenSaverEnable( )
		; PCStandby( )
		; PCLogOff( )
		; PCShutDown( )
		; PCRebootPrompt( )
		; PromptYesNo( _text := "Default Question - Should I Speak?", _action := "speak text ""Default Yes Response!""" )
		; MinimizeWindowsByClass( _name := "IEFrame" )
		; CloseWindowsByClass( _name := "IEFrame" )
		; HideWindowsByClass( _name := "IEFrame" )
		; ShowWindowsByClass( _name := "IEFrame" )
		; SetResolution( _w, _h, _colors := 32 )
		; OpenRegEdit( _path := "HKLM\Software\Microsoft\Windows\CurrentVersion" )
		; YesResponseToPrompt( )
		; TimeLapseScreenshots( _path := "C:\Temp\", _number := 10, _delay := 5 )
		; OnProcessClose( _process := "notepad.exe", _action := "speak text ""Notepad was closed!""" )
	}


	;;
	;; Return the path for NirCmd...
	;;
	path( )
	{
		_path := config.Get( "__BIN__", "NirCmd" )
		return _path
	}


	;;
	;; Helper Function
	;;
	Run( _args )
	{
		util.Run( this.path( ), _args )
	}


	;;
	;; Helper Function
	;;
	RunWait( _args )
	{
		util.RunWait( this.path( ), _args )
	}


	;;
	;; Loop action n times...
	;;
	Repeat( _action, _times )
	{
		this.Run( "loop " . _times . " " . _action )
	}


	;;
	;; Wait until Firefox is closed, and then say "Firefox was closed"	nircmd.exe waitprocess firefox.exe speak text "Firefox was closed"
	;;
	OnProcessClose( _process := "notepad.exe", _action := "speak text ""Notepad was closed!""" )
	{
		this.Run( "waitprocess " . _process . " " . _action )
	}


	;;
	;; Start the default screen saver	nircmd.exe screensaver
	;;
	ScreenSaver( )
	{
		this.Run( "screensaver" )
	}


	;;
	;; Clear the clipboard	nircmd.exe clipboard clear
	;;
	ClipboardClear( )
	{
		this.Run( "clipboard clear" )
	}


	;;
	;; Set the display mode to 800x600x24bit colors	nircmd.exe setdisplay 800 600 24
	;;
	SetResolution( _w, _h, _colors := 32 )
	{
		this.Run( "setdisplay " . _w . " " . _h . " " . _colors . "" )
	}


	;;
	;; Sets the Default and Default Communication for the named Audio Device
	;;
	SetDefaultSoundDevice( _name )
	{
		this.RunWait( "setdefaultsounddevice """ . _name . """ 1" )
		this.RunWait( "setdefaultsounddevice """ . _name . """ 2" )
	}


	;;
	;; Converts Text to Speech
	;;
	TextToSpeech( _text )
	{
		this.Run( "speak text """ . _text . """" )
	}


	;;
	;; Speaks the text currently in the clipboard (For Windows XP/Vista/7/8).	speak text ~$clipboard$
	;;
	ClipboardToSpeech( )
	{
		this.TextToSpeech( "~$clipboard$" )
	}


	;;
	;; Speaks the text stored inside speak.txt into speak.wav filename (For Windows XP/Vista/7/8).	speak file "c:\temp\speak.txt" 0 100 "c:\temp\speak.wav" 48kHz16BitStereo
	;;
	FileToSpeech( _path, _save_path:="C:\Temp\speak.wav" )
	{
		this.Run( "speak file """ . _path . """ 0 100 """ . _save_path . """ 48kHz16BitStereo" )
	}


	;;
	;; Create a shortcut
	;;
	CreateShortcut( _path, _target )
	{
		this.Run( "cmdshortcut """ . _path . """ """ . _target . """" )
	}


	;;
	;; Answer 'Yes' to a standard Windows message-box.	nircmd.exe dlg "" "" click yes
	;;
	YesResponseToPrompt( )
	{
		this.Run( "dlg """" """" click yes" )
	}


	;;
	;; Create a shortcut on your desktop that switch the system volume between the mute and normal state.	nircmd.exe cmdshortcut "~$folder.desktop$" "Switch Volume" mutesysvolume 2
	;;
	AudioToggleMuteShortcut( )
	{
		this.CreateShortcut( "~$folder.desktop$", """Switch Volume"" mutesysvolume 2" )
	}


	;;
	;; Open the door of J: CD-ROM drive	nircmd.exe cdrom open j:
	;;
	CDRomOpen( _path )
	{
		this.Run( "cdrom open """ . _path . """" )
	}


	;;
	;; Close the door of Y: CD-ROM drive	nircmd.exe cdrom close y:
	;;
	CDRomClose( _path )
	{
		this.Run( "cdrom close """ . _path . """" )
	}


	;;
	;; Set the volume while clamping it between the minimum and maximum values...
	;;
	AudioSetVolume( _value:=65535 )
	{
		this.Run( "setsysvolume """ . math.clamp( _value, 0, 65535 ) . """" )
	}


	;;
	;; Modify Volume...
	;;
	AudioModifyVolume( _value:=5000 )
	{
		this.Run( "changesysvolume """ . _value . """" )
	}


	;;
	;; Set volume to maximum
	;;
	AudioSetVolumeMax( _value:=65535 )
	{
		this.AudioSetVolume( _value )
	}


	;;
	;; Increase the system volume by 2000 units (out of 65535)	nircmd.exe changesysvolume 2000
	;;
	AudioIncreaseVolume( _value:=2000 )
	{
		this.AudioModifyVolume( _value )
	}


	;;
	;; Decrease the system volume by 5000 units (out of 65535)	nircmd.exe changesysvolume -5000
	;;
	AudioDecreaseVolume( _value:=-2000 )
	{
		this.AudioModifyVolume( _value )
	}


	;;
	;; Unmute the system volume	nircmd.exe mutesysvolume 0
	;;
	AudioUnMute( )
	{
		this.Run( "mutesysvolume 0" )
	}


	;;
	;; Mute the system volume	nircmd.exe mutesysvolume 1
	;;
	AudioMute( )
	{
		this.Run( "mutesysvolume 1" )
	}


	;;
	;; Switch the system volume between the mute and normal state.	nircmd.exe mutesysvolume 2
	;;
	AudioToggleMute( )
	{
		this.Run( "mutesysvolume 2" )
	}


	;;
	;; Turn off the monitor	nircmd.exe monitor off
	;;
	MonitorOff( )
	{
		this.Run( "monitor off" )
	}


	;;
	;; Turn off the monitor	nircmd.exe monitor off
	;;
	; MonitorOn( )
	; {
		; this.Run( "monitor on" )
	; }


	;;
	;; Disable the screen saver	nircmd.exe regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 0
	;;
	ScreenSaverDisable( )
	{
		this.Run( "regsetval sz ""HKCU\control panel\desktop"" ""ScreenSaveActive"" 0" )
	}


	;;
	;; Enable the screen saver	nircmd.exe regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 1
	;;
	ScreenSaverEnable( )
	{
		this.Run( "regsetval sz ""HKCU\control panel\desktop"" ""ScreenSaveActive"" 1" )
	}


	;;
	;; Put your computer in 'standby' mode	nircmd.exe standby
	;;
	PCStandby( )
	{
		this.Run( "standby" )
	}


	;;
	;; log off the current user	nircmd.exe exitwin logoff
	;;
	PCLogOff( )
	{
		this.Run( "exitwin logoff" )
	}


	;;
	;; Turn off your computer	nircmd.exe exitwin poweroff
	;;
	PCShutDown( )
	{
		this.Run( "exitwin poweroff" )
	}


	;;
	;; Ask question, and if you answer 'Yes', perform action.	nircmd.exe qboxcom "Do you want to reboot ?" "question" exitwin reboot
	;;
	PromptYesNo( _text := "Default Question - Should I Speak?", _action := "speak text ""Default Yes Response!""" )
	{
		this.Run( _text . " ""question"" " . _action . "" )
	}


	;;
	;; Ask if you want to reboot, and if you answer 'Yes', reboot the computer.	nircmd.exe qboxcom "Do you want to reboot ?" "question" exitwin reboot
	;;
	PCRebootPrompt( )
	{
		this.PromptYesNo( "Would you like to reboot your PC now?", "exitwin reboot" )
	}


	;;
	;; Minimize all your Internet Explorer windows	nircmd.exe win min class "IEFrame" / "CabinetWClass"
	;;
	MinimizeWindowsByClass( _name := "IEFrame" )
	{
		this.Run( "win min class """ . _name . """" )
	}


	;;
	;; Close all your Internet Explorer windows	nircmd.exe win close class "IEFrame" / "CabinetWClass"
	;;
	CloseWindowsByClass( _name := "IEFrame" )
	{
		this.Run( "win close class """ . _name . """" )
	}


	;;
	;; Hide all your Internet Explorer windows	nircmd.exe win hide class "IEFrame"
	;;
	HideWindowsByClass( _name := "IEFrame" )
	{
		this.Run( "win hide class """ . _name . """" )
	}


	;;
	;; Show all your Internet Explorer windows (after you made them hidden with previous example)	nircmd.exe win show class "IEFrame"
	;;
	ShowWindowsByClass( _name := "IEFrame" )
	{
		this.Run( "win show class """ . _name . """" )
	}


	;;
	;; Open the desired Registry key/value in RegEdit	nircmd.exe regedit "HKLM\Software\Microsoft\Windows\CurrentVersion" "CommonFilesDir"
	;;
	OpenRegEdit( _path := "HKLM\Software\Microsoft\Windows\CurrentVersion" )
	{
		this.Run( "regedit """ . _path . """ ""CommonFilesDir""" )
	}


	;;
	;; Wait 2 seconds, and then save the current screen to shot.png	nircmd.exe cmdwait 2000 savescreenshot "f:\temp\shot.png"
	;; Save 10 screenshots in a loop, and wait 60 seconds between the screenshot save calls. The filenames of the screenshot will contain the time and date 
	;; of the saved screenshot.	nircmd.exe loop 10 60000 savescreenshot c:\temp\scr~$currdate.MM_dd_yyyy$-~$currtime.HH_mm_ss$.png
	;;
	TimeLapseScreenshots( _path := "C:\Temp\", _number := 10, _delay := 5 )
	{
		this.Repeat( "" . _delay * 1000 . " savescreenshot " . _path . "ScreenShot_~$currdate.MM_dd_yyyy$-~$currtime.HH_mm_ss$.png" )
	}
}