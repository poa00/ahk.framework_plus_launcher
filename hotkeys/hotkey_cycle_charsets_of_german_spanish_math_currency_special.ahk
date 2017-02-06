;;
;; Charset Cycler - Josh 'Acecool' Moser
;;


;;
;; Index - WIN + F8 to toggle between Spanish / German overlapping characters
;; German Overlapping Characters ( WIN + F8 To Switch Between the German and Spanish Chars )
;;		Alt + 			a o u		==		ä ö ü
;;		ALT + SHIFT + 	A O U		==		Ä Ö Ü
;;
;; Other German Characters:
;;		ALT + 			S			==		ß
;;
;; Spanish Overlapping Characters ( WIN + F8 To Switch Between the German and Spanish Chars )
;;		Alt + 			a o u		==		á ó ú
;;
;; Other Spanish Characters:
;;		ALT + 			e i n ? !	==		é í ñ ¿ ¡
;;
;; Special Characters
;;		ALT + 			c l r t		==		© ® ™
;;		ALT + CTRL +	c e l		==		¢ € £
;;
;; Match Characters
;;		ALT + 			d =	/ -	0	==	Δ ≡ ÷ ± ø
;;		ALT + SHIFT		D > < * +	==	δ ≥ ≤ √ ±
;;


;;
;; Set up Language Keys...
;;
OnInit_hotkey_cycle_charsets_of_german_spanish_math_currency_special( )
{
	;; Set Default ( German )
	config.SetDefault( "HotKeys", "LanguageKeys", 0 )

	;; Load the active key-set into memory...
	global German_Spanish_Keys_Toggle:=config.Get( "HotKeys", "LanguageKeys" )
}


;;
;; WIN + F8 - Toggle between Spanish and German chars - SPANISH DEFAULT!
;;
LWin & F8::
	;; Define our var to be set to itself or 0 if it wasn't set ( or when 0 is seen as false )...
	German_Spanish_Keys_Toggle := ( German_Spanish_Keys_Toggle is digit ) ? German_Spanish_Keys_Toggle : 0
	_notification = "Unknown"

	;; Enable Spanish
	if German_Spanish_Keys_Toggle = 0
	{
		; TrayTip, Spanish Keys Enabled, áóóúú
		OnMessage( 0x404, "" )
		OnMessage( 0x404, Func( "Toast_Callback_Help" ) )
		TrayTip, Spanish Keys Enabled, ALT + a / o / u [ + SHifT ]: á / ó / ú or á / ó / ú
		_notification = "Español Activado! -- Click for more hot keys and help!"
	}

	;; Enable German
	if German_Spanish_Keys_Toggle = 1
	{
		OnMessage( 0x404, "" )
		OnMessage( 0x404, Func( "Toast_Callback_Help" ) )
		TrayTip, German Keys Enabled, ALT + a / o / u [ + SHifT ]: ä / ö / ü or Ä / Ö / Ü
		_notification = "Deutsch Aktiviert! -- Click for more hot keys and help!"
	}

	;; Update the cycler with the new choice..
	German_Spanish_Keys_Toggle := mod( German_Spanish_Keys_Toggle + 1, 2 )

	;; Save the most recent choice...
	config.Set( "HotKeys", "LanguageKeys", German_Spanish_Keys_Toggle )

	;; Speech
	nircmd.TextToSpeech( _notification )
return


;;
;; Toggle-able hotkeys for German / Spanish - These 3 keys are SHARED so we have to swap them...
;;
!+a::
	if !German_Spanish_Keys_Toggle
		sendInput	{Ä}
	else
		sendInput	{á}
return

!a::
	if !German_Spanish_Keys_Toggle
		sendInput	{ä}
	else
		sendInput	{á}
return

; o
!+o::
	if !German_Spanish_Keys_Toggle
		sendInput	{Ö}
	else
		sendInput	{ó}
return

!o::
	if !German_Spanish_Keys_Toggle
		sendInput	{ö}
	else
		sendInput	{ó}
return

; u
!+u::
	if !German_Spanish_Keys_Toggle
		sendInput	{Ü}
	else
		sendInput	{ú}
return

!u::
	if !German_Spanish_Keys_Toggle
		sendInput	{ü}
	else
		sendInput	{ú}
return


;;
;; French - French Quotes
;;
; !+>::		sendInput	{»}
; !+<::		sendInput	{«}


;;
;; German Umlauts and Special Characters - Josh 'Acecool' Moser
;; ▓▒░│┤╡╢╖╕║╣╗╝╜╛┐└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▀▐
;;

;; a
; !+a::		SendInput	{Ä}
; !a::		SendInput	{ä}

;; o
; !+o::		SendInput	{Ö}
; !o::		SendInput	{ö}

;; u
; !+u::		SendInput	{Ü}
; !u::		SendInput	{ü}

;; ss
!s::		SendInput	{ß}




;;
;; Spanish Special Chars a = á, e = é, i = í, o = ó, u = ú, n = ñ, ! = ¡, ? = ¿
;;
;; These are unique so we don't need to swap them... I may set it up differently though to avoid confusion and have extra cycles for math etc.. chars..
;;

;; e
!+e::		sendInput	{é}
!e::		sendInput	{é}

;; i
!+i::		sendInput	{í}
!i::		sendInput	{í}

;; n
!+n::		sendInput	{ñ}
!n::		sendInput	{ñ}

;; Spanish ?
!?::		sendInput	{¿}

;; Spanish !
!!::		sendInput	{¡}





;;
;; Special Characters Charset - Josh 'Acecool' Moser
;;

;; Copyright
!c::		sendInput	{©}

;; Penny / Cents
^!c::		sendInput	{¢}

;; Europe Euro
^!e::		sendInput	{€}

;; English Pounds
^!l::		sendInput	{£}

;; All Rights Reserved
!r::		sendInput	{®}

;; Trademarked
!t::		sendInput	{™}





;;
;; Math Charset - Josh 'Acecool' Moser
;;

;; Delta
!+d::		sendInput	{δ}
!d::		sendInput	{Δ}

;; Greater / Less-Than or Equal-To
!+>::		sendInput	{≥}
!+<::		sendInput	{≤}
; !+>::		sendInput	{»}
; !+<::		sendInput	{«}

;; Identical To
!=::		sendInput	{≡}

;; Division / Sqrt
!/::		sendInput	{÷}
!+*::		sendInput	{√}

;; Plus or Minus
!++::		sendInput	{±}
!-::		sendInput	{±}

;; Null
!0::		sendInput	{ø}



;;
;; Other Charset - ▓▒░│┤╡╢╖╕║╣╗╝╜╛┐└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▀▐
;;



