# AcecoolAHK_Framework README #

AcecoolAHK_Framework is an AutoHotkey framework which will support automatically loading of scripts from a neatly organized folder in your favorite Cloud backup folder...
It can now also launch executables and other files by dropping them into the addons_exe folder ( runs them outside of the framework in their own process; will execute any type of file ) - In order for these to load, you need to rebuild the framework loader files ( dialog asks you on launch ) and it will ask you whether you want to load or skip each file in this folder for security reasons ( Will soon add a hashing feature so you only need to whitelist an application once - may add automated virustotal search soon ).


### What is this repository for? ###

* An easy to use AutoHotkey script management solution which allows drag-and-drop integration for addon scripts and jobs / operations such as my Screenshot system ( Which captures a window, saves it with a useful name in Dropbox\Screenshots\ and creates a Windows notification letting you know the name with an OnClick function to open the screenshot and a dialog asking if you want to make the screenshot public by moving it into Dropbox\Public\Screenshots\ and giving you the public-direct-link to it to share )
* 0.4.20


### How do I get set up? ###

* 1 ) AutoHotkey must be installed on your system first; download it here: https://autohotkey.com/download/
* 2 ) Download the Repo Contents as a zip and extract it to your favorite Cloud directory on your PC ( such as: C:\Users\%UserName%\Dropbox\ ) **Note: Currently DropBox is required in order to use the screenshot active window hotkey and use the automatic copy public link to clipboard feature ( when you choose to make screenshot public ). Otherwise you can alter the screenshot folder in the config.ini file.
* 3 ) If you are going to use DropBox ( and you did not alter the AHK Install Directory; if you did, see step 3c ), skip to step 4, otherwise you will need to edit setup.bat and alter the paths ( Future installation will be easier; I will make this even easier by adding a setup.ini config file soon )
* 3a) Alter: set CloudPath=%UserProfile%\DropBox line to use the path you want. %UserProfile% is replaced with C:\sers\<Your username>\ and isn't required; you could write the exact path after the =...
* 3b) If you want to rename the AcecoolAHK_Framework\ directory, you will need to change the line containing: set CloudAHKPath=%CloudPath%\AcecoolAHK_Framework  ( Only alter AcecoolAHK_Framework text as the folder you used in 3a will be the root directory )
* 3c) If you altered the Installation Path for AutoHotkey you will need to edit the line containing: set AHKInstallPath=C:\Program Files\AutoHotkey - enter the exact path after the =
* 3d) Nothing else needs to be edited for the purpose of altering the install directory...
* 4 ) Execute [ As Administrator ]: C:\Users\%UserName%\Dropbox\acecoolahk_framework\_assets\_setup\setup.bat - This generates an AutoHotkey.ahk replacement file to run the framework ( and puts it into your Documents folder ) and symbolically links the AHK Install path Lib directory to the framework libraries\ folder... ( Backups are made if AutoHotkey.ahk and/or Lib\ exists )
* 5 ) Follow on-screen instructions and verify the paths are correct ( Note, this will .bat the AutoHotkey.ahk in your Documents folder [ it will create a backup if one exists ] so when you run AutoHotkey.exe the framework will load by default, It will also add or replace the Libs folder in the AHK Install directory [ Creating a backup if one already existed ] by adding a Symbolic link from AutoHotkey\Libs\ to C:\Users\%UserName%\Dropbox\acecoolahk_framework\libraries\ - it will also create useful Environmental variables ).


### Future Installation Instructions ###

* Download the Repo Contents as a zip and extract it to your favorite Cloud directory on your PC ( such as: C:\Users\%UserName%\Dropbox\ )
* Execute: C:\Users\%UserName%\Dropbox\acecoolahk_framework\setup\setup_acecoolahk_framework.ahk
* Follow on-screen instructions and verify the paths are correct ( Note, this will add the AutoHotkey.ahk in your Documents folder [ it will create a backup if one exists ] so when you run AutoHotkey.exe the framework will load by default, It will also add or replace the Libs folder in the AHK Install directory [ Creating a backup if one already existed ] by adding a Symbolic link from AutoHotkey\Libs\ to C:\Users\%UserName%\Dropbox\acecoolahk_framework\libraries\ - it will also create useful Environmental variables ).


### Contribution guidelines ###

* Please ensure all submitted code follows the Acecool Company Code Standards to ensure uniformity.
* Please ensure all code is thoroughly tested prior to submission - If you need help you can either submit the idea using Issues tracker, or submit what code you have in a new pull-request and explain which part you need help with. Alternatively you may contact me on Discord: https://discord.gg/yk779zT
* Any code submitted must be your own or you must have permission to submit it. Plagiarism will not be tolerated. All submitted code will fall under the Acecool Company License ( Free to use, modify and learn from; original link must remain - may not resell without prior authorization )


### To Do ###
+ Add Automatic loading capability
+ Add GUI to manage automatically loaded scripts and jobs and to create hotkeys for those jobs ( Such as Alt + F12 for my screenshot system )
+ Simplify for release ( Mine is loaded with a lot of things I use where-as they may not all be useful to everyone, but most will be released for use )


### Folder Structure ###
+ CLOUD_FOLDER\ ( Your Cloud Drive - You don't need to put it in a cloud folder, but if you do it can be synced across all computers and you will have the same hotkeys available on all.. the only thing you need to do is execute the setup file on each new pc and sometimes after AHK updates )
	+	AcecoolAHK_Framework\ ( AcecoolAHK_Framework Primary Folder )
		+	_assets\ ( Folder which contains all resources used by scripts, help files, etc.. )
			+ __load_order_files__\
				- This folder contains the dynamically generated inclusion lists for the framework...
			+ autoloader\
				- Holds all of the AutoLoader relevant files such as __acecoolahk_framework_autoloader__.ahk which has all of the functions for the autoloader, __generate_base/full__.ahk files which generates the __load_order_files__... run_framework_base/full.ahk files which starts the framework ( although the base is for processes and won't run unless the framework has been executed at least once and the load_order_files exist; the full file is internal file as framework_launcher.ahk is what loads the full-version of the framework..
			+	bin\ ( Contains all of the useful binaries which are used within the framework or scripts / jobs / operations, etc.. )
				+ DebugView\
					- This needs to be downloaded from Microsoft SysInternals - I recommend it...
				+ NirCMD_x64\
					- 64bit version of the command-line utility. This is the default version used in my scripts.
				+ NirCMD_x86\
					- NirSoft CommandLine utility ( Useful for many scripts such as text-to-speech, changing default audio, communication, etc.. devices, and much more which also executes MUCH faster than AHK ever could and doesn't rely on hacks to work as AHK does in many scripts )
			+ icons\ ( Icons used by all scripts, etc.. )
				- All icons used by AcecoolAHK_Framework and scripts..
			+ images\
				- All images used for scripts, help, etc..
			+	setup\
				- Folder containing all of the scripts relating to setting up the framework on any new pc...
			+ shortcuts\
				- Links to useful websites, libraries, and Windows systems or options..
			+ templates\
				- This folder holds the templates as to what the load_order_files will look like, and for default config, etc... Basically the main file, pre-inclusion list and post-inclusion list - using a very basic append-to-file system...
			+ acecool_help.html
				- Readme containing all default hotkeys and description for each..
		+ addons_exe\
			- Addons / scripts that are launched using the "run" command in their own process.. This folder allows executables, etc...
		+ addons_inc\
			- Addons / Scripts that are included in with the rest of the framework...
		+ addons_run\
			- Addons / scripts that are launched using the "run" command in their own process..
		+ classes\
			- Folder to house auto-included class files..
		+ definitions\
			- Auto-included folder for definition scripts ( for ENUMeration, CONSTants, Globals, etc.. )
		+ functions\
			- ( Folder containing all of the files containing all functions used within the scripts )
		+ hotkeys\
			- ( Folder containing all of the individual hotkey files )
		+ libraries\
			- ( Folder for all of the libraries used in any scripts or jobs in the framework; this is the "real" folder where a symbolic link routes to from the AutoHotkey install folder\libs\ )
		+ processes\
			- ( Folder containing all of the jobs / operations / processes that will run on the lightweight framework [ such as the screenshot job ] so they can execute without blocking hotkeys from firing, etc.. )
		




### Who do I talk to? ###

* Josh 'Acecool' Moser
* Discord: https://discord.gg/yk779zT