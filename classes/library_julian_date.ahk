;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;


;;
;; Variables, CONSTants, ENUMerations, etc..
;;
class julian_date
{
	;;
	;;
	;;
	example( )
	{

		_days := this.DaysSinceEpoch( )
		MsgBox, Julian Days since the Epoch ( January 1 1970 ): %_days%
	}


	;;
	;; Full Julian Date Function ( Author: SKAN ) ( Days since 4715 BC )
	;;
	CurrentDay( YMD="", ChkYMD=1, Rn=1 )
	{
		if ChkYMD
			FormatTime, YMD, %YMD%, yyyyMMdd

		Y := SubStr( YMD, 1,4 ) + 0
		M := SubStr( YMD, 5,2 ) + 0
		D := SubStr( YMD, 7,2 ) + 0

		If ( M<=2 )
			M := M+12, Y := Y-1
		
		A := 2 - Floor( Y/100 ) + Floor( Floor( Y/100 ) / 4 )
		B := Floor( 365.25  * ( Y+4716) )
		C := Floor( 30.6001 * ( M+1) )
		Return Rn ? Floor( A+B+C+D -1524.5 ) : Round( A+B+C+D -1524.5, 1 )
	}


	;;
	;; Returns the number of days since the Epoch ( Jan 1 1970 ) excluding today ( so hours, minutes, and seconds can be calculated independently )
	;;
	DaysSinceEpoch( _add_today = false )
	{
		;; Julian Days since 4715 BC subtracting the difference to reach Jan 1 1970....
		_days := ( this.CurrentDay( A_NOW ) - 2440587 )
		_days := ( _add_today ) ? _days + 1 : _days
		return _days
	}


	;;
	;;
	;;
	; DaysSinceEpoch( )
	; {
		;; We need to grab the current hours, minutes and seconds of today to add on to our timestamp...
		; FormatTime, _hours, %A_NOW%, HH
		; FormatTime, _minutes, %A_NOW%, mm
		; FormatTime, _seconds, %A_NOW%, ss

		;; Julian Days since 4715 BC
		; _days := ( JulianDate( A_NOW ) ) - 2440587
		; _jseconds := ( _days * 24 * 60 * 60 ) + ( _hours * 60 * 60 ) + ( _minutes * 60 ) + _seconds ;; need to add current day seconds...
		; _time:= this.TimeFromStamp( _jseconds )
		; MsgBox, %_days% and seconds: %_jseconds% and time: %_time% and msec: %A_Msec%
	; }
}