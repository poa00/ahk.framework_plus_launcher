;;
;; Modules Folder Readme - Josh 'Acecool' Moser
;;
The modules folder is similar to addons_inc except these files are considered "internal" or "required" for one reason or another... These files
	may call on files in the addons folder or elsewhere...

For example:
	acecoolahk_framework_version_control.ahk sets up the version information in the config.ini, reads the version info from the git repo, and
	houses the logic which calls on the changelog dialog ( in addons_inc so it can be deleted by the user ) if it exists, or calls on the
	auto-updater ( also in addons_inc meaning it can be removed by the user if they don't want that feature - both have settings to disable
	features too if you only want to be notified but the version control module can do that on its own )..

	The versioning system is important, but the other features aren't... In short, primary add on features or features integral to the
	functionality of the framework which don't fit in any of the other internal folders will reside here.. These will typically only integrate
	logic and calls to other files or functions, etc.. rather than including everything so slower pcs can run the basics and none of the bulk if
	they so choose...