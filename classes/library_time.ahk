;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;
; time.example( )



;;
;; Variables, CONSTants, ENUMerations, etc..
;;
class time
{
	;;
	;;
	;;
	example( )
	{
		;; Julian days since the Epoch...
		_days := julian_date.DaysSinceEpoch( )
		MsgBox, Julian Days since Epoch without today ( Since January 1 1970 ): %_days%

		;; Seconds since the Epoch
		_timestamp := this.Timestamp( )
		_timefromstamp := this.TimeFromStamp( _timestamp )
		MsgBox, Seconds since Epoch including today's elapsed ( Since January 1 1970 ): %_timestamp% and %_timefromstamp%

		;; RealTime
		_realtime := this.RealTimestamp( )
		MsgBox, Real Timestamp since Epoch - includes Microseconds: %_realtime%

		;;
		
	}


	;;
	;; Timestamp - Time in seconds since the Epoch ( December 31 23:59:59 1969 or January 1 1970 00:00:00 )
	;;
	Timestamp( )
	{
		;; We need to grab the current hours, minutes and seconds of today to add on to our timestamp...
		FormatTime, _hours, %A_NOW%, HH
		FormatTime, _minutes, %A_NOW%, mm
		FormatTime, _seconds, %A_NOW%, ss

		_days := julian_date.DaysSinceEpoch( )
		_timestamp := ( _days * 24 * 60 * 60 ) + ( _hours * 60 * 60 ) + ( _minutes * 60 ) + _seconds ;; need to add current day seconds...

		return _timestamp
	}


	;;
	;; Timestamp also including Milliseconds / Microseconds
	;;
	RealTimestamp( )
	{
		return this.Timestamp( ) . "." . A_MSec
	}


	;;
	;; Convert Timestamp to Readable Time...
	;;
	TimeFromStamp( _stamp )
	{
		;; Start January 1 1970 00:00:00
		_current := 1970

		;; Add _stamp seconds to _current time...
		_current += _stamp, Seconds

		;; Format into Human-Friendly Time Output...
		FormatTime, _time, %_current%, dd.MMM.yyyy HH:mm:ss

		return _time
	}
}

; now := A_NowUTC
; EnvSub, now,1970, seconds
; MsgBox % "epoch now: " now

