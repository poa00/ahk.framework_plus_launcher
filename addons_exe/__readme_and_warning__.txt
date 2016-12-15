;;
;; addons_exe\ Readme - Josh 'Acecool' Moser
;;
This folder is for executable files that you wish to run with the framework... I will eventually add protection to prevent more than one of each to be loaded
at a time if requested; but if it is an AHK compiled script it is easy enough for it to prevent loading more than one and other programming languages make it
just as easy..


! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !
! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !

You are going to execute executables dynamically; anything can be dropped in this directory and it will be executed!!!!!!

Because of the dangers of this directory it is enabled by default but it asks about each file to include...
To enable blindly allowing it to load all files.. or to disable it.. follow these directions:

1 ) Open _assets\autoloader\__generate_full__.ahk

2 ) Read through lines 36 - 59 and follow the instructions..

3 ) In case the lines have shifted:
	Uncomment one, but not both, of the AutoLoader_ReadFiles( "addons_exe", ...... ) lines... The line with 3 trues will confirm every file to include where-as
		the line with 2 trues will include everything blindly...

		;; Uncomment the line directly below this comment to enable the exe folder and to include everything blindly...
		; AutoLoader_ReadFiles( "addons_exe", true, true, true )

		;; Uncomment the line directly below this comment to enable the exe folder and to be asked about each file to include...
		AutoLoader_ReadFiles( "addons_exe", true, true )

! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !
! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! ! ! ! ! ! ! ! WARNING ! ! ! ! ! !