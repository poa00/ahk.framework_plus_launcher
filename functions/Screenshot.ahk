;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Notes:
;; If I neglect to give credit where credit is due, please contact me. The old forums have been shut down and I haven't
;;	been able to find all of the old resources I've used, and I did write quite a bit in my AHK Folder - My Name at the
;;	top is part of my Default AHK Template - if someone else created something I will use their name at the top and / or
;;	also above the function or script / hotkey...
;; Uses older Gdip.ahk - will update soon.
;;


;;
;; Window Screenshot Function... Save screenshot from defined coordinates.
;;
Screenshot( _path, screen )
{
	_pToken := Gdip_Startup( )
	_raster := 0x40000000 + 0x00CC0020

	_name_clean := ScreenshotName( )
	Gdip_SaveBitmapToFile( _pBitmap, _path _name_clean, 100 )
	Gdip_DisposeImage( _pBitmap )
	Gdip_Shutdown( _pToken )
	return _name_clean
}