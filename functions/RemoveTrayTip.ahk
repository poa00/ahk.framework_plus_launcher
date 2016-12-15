;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Helper function to remove the tray-tip ( for 
;;	
RemoveTrayTip( )
{
	SetTimer, RemoveTrayTip, Off
	TrayTip	;; without parameters, removes displayed traytip
}