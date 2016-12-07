;;
;; Assets / _setup Readme - Josh 'Acecool' Moser
;;
This folder houses default files and files used in the setup process ( AutoHotkey.ahk will be auto-generated while running setup.bat )...


;;
;; IMPORTANT SETUP INSTRUCTIONS!
;;
You may need to modify setup.bat to change the folder paths... Run it without running as admin to verify paths and close it instead of pressing any button...
If correct then re-run as admin. If not, make changes to the following lines, save and run as admin. Verify and if correct.. proceed...

You only need to modify the plain-text portions in most cases... 

For example, if you want to use OneDrive, simply change "\DropBox" to "\OneDrive", no quotes, and everything else can remain the same.

If you want to change the framework directory to something less "My" name... Change the 1 instance of "\AcecoolAHK_Framework" in CloudAHKPath
to something like "\AutoHotkey" and make sure you rename the directory in the cloud folder too...



:: Path to where your cloud program stores files... No trailing slash on ANY line...
:: By default this is: C:\Users\%UserName%\DropBox
set CloudPath=%UserProfile%\DropBox

:: Path, from CloudPath, where you store your AHK Files...
:: By default this is: C:\Users\%UserName%\DropBox\AcecoolAHK_Framework
set CloudAHKPath=%CloudPath%\AcecoolAHK_Framework

:: Path, from CloudPath, where you store your library Files...
:: By default this is: C:\Users\%UserName%\DropBox\AcecoolAHK_Framework\libraries
set CloudAHKLibPath=%CloudAHKPath%\libraries

:: Path, from CloudPath, where you store the AHK Setup Files...
:: By default this is: C:\Users\%UserName%\DropBox\AcecoolAHK_Framework\_assets\_setup
set CloudAHKSetupPath=%CloudAHKPath%\_assets\_setup

:: AHK Installation Dir
:: By default this is: C:\Program Files\AutoHotkey
set AHKInstallPath=C:\Program Files\AutoHotkey

:: AHK Libraries Installation Dir
:: By default this is: C:\Program Files\AutoHotkey\Lib
set AHKLibPath=%AHKInstallPath%\Lib