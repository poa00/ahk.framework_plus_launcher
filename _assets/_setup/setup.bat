cls
@echo off
::
:: Setup AHK on this PC - Josh 'Acecool' Moser
::


::
:: BEGIN Configuration
::

:: Path to where your cloud program stores files... No trailing slash on ANY line...
:: By default this is: C:\Users\%UserName%\DropBox
set CloudPath=%UserProfile%\DropBox

:: Path, from CloudPath, where you store your AHK Files...
:: By default this is: C:\Users\%UserName%\DropBox\AcecoolAHK_Framework - this takes what you entered in CloudPath above and adds a sub-folder to it ( AcecoolAHK_Framework )
set CloudAHKPath=%CloudPath%\AcecoolAHK_Framework

:: Path, from CloudAHKPath, where you store your library Files...
:: By default this is: C:\Users\%UserName%\DropBox\AcecoolAHK_Framework\libraries - This takes what you entered in CloudAHKPath and adds a sub-folder to it ( libraries )
set CloudAHKLibPath=%CloudAHKPath%\libraries

:: Path, from CloudAHKPath, where you store the AHK Setup Files...
:: By default this is: C:\Users\%UserName%\DropBox\AcecoolAHK_Framework\_assets\_setup - This takes what you entered in CloudAHkPath and adds a folder and another in it.
set CloudAHKSetupPath=%CloudAHKPath%\_assets\_setup

:: AHK Installation Directory
:: By default this is: C:\Program Files\AutoHotkey
set AHKInstallPath=C:\Program Files\AutoHotkey

:: AHK Libraries Installation Directory
:: By default this is: C:\Program Files\AutoHotkey\Lib
set AHKLibPath=%AHKInstallPath%\Lib


:: AHK Loader File Config - Note: If using AHK Variables, use 2 % signs here....
:: Note: You can use exact path or you can use the dynamic method which is %%A_AppData%%\..\..\CloudFolder\AcecoolAHK_Framework\
:: Where %%A_AppData%%\..\..\ IS C:\Users\%UserName%\
:: Uncomment the next line if you want exact path and comment the one currently commented...
set AHKLoaderWorkingDir=%CloudAHKPath%
REM set AHKLoaderWorkingDir=%%A_AppData%%\..\..\Dropbox\AcecoolAHK_Framework

:: AHK Loader File inside the Cloud Folder...
:: This is the file AutoHotkey.exe > Documents\AutoHotkey.ahk executes inside of the AcecoolAHK_Framework\ directory to run the 
:: entire framework suite and run_framework_base.ahk is used for jobs that need access to functions, etc...
set AHKLoaderFile=framework_launcher.ahk

:: Autogenerate AutoHotkey.ahk file...
set AHKAutoGeneratedFile=%CloudAHKSetupPath%\AutoHotkey.ahk


::
:: END Configuration
::


::
:: Read Registry for Documents Path
::
echo. Reading the registry for the "My Documents" or "Documents" folder, including other languages, location...
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal`
) DO SET DocumentsPath=%%M


:: Final resting place for the auto generated file...
set AHKDocsAutoGeneratedFile=%DocumentsPath%\AutoHotkey.ahk

::
:: AutoHotkey.ahk Auto-Generated File to be copied into / as "Documents\AutoHotkey.ahk" so AutoHotkey.exe will run this file...
::
REM call _generate_autohotkey_ahk_script.bat %AHKAutoGeneratedFile% %AHKLoaderWorkingDir% %AHKLoaderFile%
echo ;;>%AHKAutoGeneratedFile%
echo ;; AutoHotkey Script - Josh 'Acecool' Moser>>%AHKAutoGeneratedFile%
echo ;;>>%AHKAutoGeneratedFile%
echo.>>%AHKAutoGeneratedFile%
echo ;; Set the working directory to be that of my AHK Scripts folder for easy includes...>>%AHKAutoGeneratedFile%
echo SetWorkingDir, %AHKLoaderWorkingDir%>>%AHKAutoGeneratedFile%
echo.>>%AHKAutoGeneratedFile%
echo ;; Normally isn't needed with a properly formulated SetWorkingDir; using it because of compatibility issues...>>%AHKAutoGeneratedFile%
echo #include %AHKLoaderWorkingDir%>>%AHKAutoGeneratedFile%
echo.>>%AHKAutoGeneratedFile%
echo ;; Set a favicon so we know which script we're using and the load progress..>>%AHKAutoGeneratedFile%
echo Menu, Tray, Icon, _assets\icons\favicon_r90deg.ico>>%AHKAutoGeneratedFile%
echo.>>%AHKAutoGeneratedFile%
echo ;; Include the autoloader>>%AHKAutoGeneratedFile%
echo #include %AHKLoaderFile%>>%AHKAutoGeneratedFile%


::
:: Verification...
::
echo Please verify the following paths before continuing... If incorrect, close the command prompt and make the appropriate changes before relaunching..
echo.
echo.

echo -----------------------------------------------------------------------------------
echo.
echo AHK Installation Path - This is where AutoHotkey is installed on your PC ( AutoHotkey.exe, AU3_Spy.exe, Installer.ahk, etc.. should be in this folder.. ).
echo Path: %AHKInstallPath%
echo.
echo -----------------------------------------------------------------------------------
echo.
echo Documents Path - This is your "My Documents" folder.
echo Path: %DocumentsPath%
echo.
echo -----------------------------------------------------------------------------------
echo.
echo Cloud Path - This is the root directory on your PC for your files uploaded to the cloud.
echo Path: %CloudPath%
echo.
echo Cloud AHK Framework Path - This is the root directory on your PC where Acecool's AutoHotkey Framework will reside.
echo Path: %CloudAHKPath%
echo.
echo Cloud AHK Libraries Path - This is the directory where all of your AHK libraries will be located ( This is the destination of the Symbolic Link )
echo Path: %CloudAHKLibPath%
echo.
echo Cloud Setup Files Path - This folder contains all of the AHK Framework setup assets ( setup.bat, AutoHotkey.ahk which will be auto-generated by setup.bat, etc.. )
echo Path: %CloudAHKSetupPath%
echo.
echo Acecool's AHK Framework Working Path - This is where the framework is located according to AutoHotkey. Note: You can use exact path or you can use the dynamic method which is %%A_AppData%%\..\..\CloudFolder\AcecoolAHK_Framework\
echo Path: %AHKLoaderWorkingDir%


pause


::
:: Setup our backup file-name
::
set t=%time:~0,8%
set t=%t::=-%
set FileName=Backup %date%%t%


::
:: Check to see if the libraries directory has already been created ( unlikely )
::
echo Checking to see if the Libraries folder exists in the AHK Installation Directory: %AHKInstallPath%
REM call _check_rename_ahk_install_dir_lib_folder.bat %AHKLibPath% %FileName%
if exist "%AHKLibPath%" (
	:: It has, rename it...
	echo Renaming "%AHKLibPath%" to "\Lib %FileName%"
	rename "%AHKLibPath%" "Lib %FileName%"
	REM exit /b Renaming "%AHKLibPath%" to "\Lib %FileName%"
) else (
	echo "%AHKLibPath%" wasn't found..
	REM exit /b "%AHKLibPath%" wasn't found..
)


::
:: Create our symbolic link...
::
echo Trying to create our symbolic link...
mklink /D "%AHKLibPath%" "%CloudAHKLibPath%"


::
:: Check to see if AutoHotkey.ahk exists in the docs folder..
::
echo Checking to see if AutoHotkey.ahk exists in your Documents folder: %DocumentsPath%
REM call _check_rename_ahk_install_dir_lib_folder.bat %AHKDocsAutoGeneratedFile% %FileName% %DocumentsPath%
if exist "%AHKDocsAutoGeneratedFile%" (
	:: It does, so rename the default file, or whatever, to something else...
	echo Renaming "%AHKDocsAutoGeneratedFile%" to "\AutoHotkey %FileName%.ahk"
	rename "%AHKDocsAutoGeneratedFile%" "AutoHotkey %FileName%.ahk"
	REM exit /b Renaming "%AHKDocsAutoGeneratedFile%" to "\AutoHotkey %FileName%.ahk"
) else (
	echo AutoHotkey.ahk wasn't found.. Copying the new one into %DocumentsPath%
	REM exit /b AutoHotkey.ahk wasn't found.. Copying the new one into %DocumentsPath%
)


::
:: Now, copy our loader file to the proper location..
::
copy "%AHKAutoGeneratedFile%" "%DocumentsPath%"

pause