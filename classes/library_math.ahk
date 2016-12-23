;;
;; AutoHotkey Script - Josh 'Acecool' Moser
;;
; math.example( )


;;
;; Math Library
;;
class math
{
	;;
	;; Generates an example dialog / output to show the uses of the new functions and to show the changes to the old ones...
	;;
	example( )
	{
		;; Line 1 and Example 1
		_ex1 := math.log( 16, 2 )
		_line1 = math.log( _value, _base ) :: Extended Log so the second arg is base.. `n-> math.log( 16, 2 ) == %_ex1%`n

		;; Line 2 and Example 2
		_ex2 := math.pow( 10, 10 )
		_line2 = math.pow( _value, _pow ) :: Added function for ** operator... `n-> math.pow( 10, 10 ) == %_ex2%`n

		;; Line 3 and Examples 3 and 3b
		_ex3 := math.powx( 63, 2 )
		_ex3b := math.powx( 64, 2 )
		_line3 = math.powx( _value, _pow = 2 ) :: Returns the highest power value contained within a provided value`n-> math.powx( 63, 2 ) == %_ex3%`n-> math.powx( 64, 2 ) == %_ex3b%`n

		;; Line 4 and Examples 4, 4b and 4c
		_ex4 := math.powxp( 63, 2 )
		_ex4b := math.powxp( 64, 2 )
		_ex4c := math.powxp( 65, 2 )
		_line4 = math.powxp( _value, _pow ) :: Does the same thing as math.powx but it multiplies the result by 2 if _value isn't == to the result ( for when the entire object won't fit in _result.. and when we do not want to SCALE DOWN )..`n-> math.powxp( 63, 2 ) == %_ex4% ie 32 * 2 so no downscaling to lose resolution or?..`n-> math.powxp( 64, 2 ) == %_ex4b% Fits perfectly, no need to scale!`n-> math.powxp( 65, 2 ) == %_ex4c% In this case downscaling wouldn't hurt much - dev discretion..`n

		;; Line 5 and Example 5
		_ex5:=math.SnapTo( 83, 45 )
		_line5 = Snaps a number to the nearest interval divisible by the number... Perfect for angles, etc..`n-> math.SnapTo( 83, 45 ) == %_ex5%`n

		;; Line 6 and Example 6
		; _ex6:=math.xxx( )
		_line6 = Empty ;		`n-> math.xxx( ) == %_ex6%`n

		;; Line 7 and Example 7
		; _ex7:=math.xxx( )
		_line7 = Empty ;		`n-> math.xxx( ) == %_ex7%`n

		;; Line 8 and Example 8
		; _ex8:=math.xxx( )
		_line8 = Empty ;		`n-> math.xxx( ) == %_ex8%`n

		;; Line 9 and Example 9
		; _ex9:=math.xxx( )
		_line9 = Empty ;		`n-> math.xxx( ) == %_ex9%`n

		;; Line 10 and Example 10
		; _ex10 := math.log( 1 )
		_line10 = Empty ;		`n-> math.log( 1 ) == %_ex10%`n
		MsgBox, AcecoolAHK_Framework Math Library Example`n`n%_line1%`n%_line2%`n%_line3%`n%_line4%`n%_line5%`n%_line6%`n%_line7%`n%_line8%`n%_line9%`n%_line10%
	}


	;;
	;; Raises _value to _power..
	;;
	pow( _value, _pow )
	{
		return ( _value ** _pow )
	}


	;;
	;; Returns the highest power value contained within in a provided value..
	;;
	;; @Example:	math.powx( 63, 2 ) == 32 which down-scales
	;; @Example:	math.powx( 64, 2 ) == 64...
	;;
	powx( _value, _pow = 2 )
	{
		return this.pow( _pow, this.floor( this.log( _value, _pow ) ) )
	}


	;;
	;; Does the same thing as math.powx but it multiplies the result by 2 if _value isn't == to the result ( for when the
	;; entire object won't fit in _result.. and when we do not want to SCALE DOWN )..
	;;
	;; @Example:	math.powxp( 64, 2 ) == 64
	;; @Example:	math.powxp( 65, 2 ) == 64 * 2 == 128 to prevent down-scaling..
	;;
	powxp( _value, _pow )
	{
		_result := this.powx( _value, _pow )
		return ( _result == _value ) ? _result : _result * 2
	}


	;;
	;; Snaps a number to the nearest interval divisible by the number...
	;;
	SnapTo( _value, _interval )
	{
		if ( !_interval || _interval == 0 )
			return _value

		return this.round( _value / _interval ) * _interval
	}
	
	
	;;
	;; Handles repetitive sin wave code into 1 line for easy motion.. abs = positive values. size = multiplies -1 or 0 to 1 range of return value.
	;;
	SinWave( _speed = 1, _size = 1, _abs = false )
	{
		_sin := this.sin( time.RealTimestamp( ) * _speed ) * _size
		if ( _abs )
			_sin = this.abs( _sin )

		return _sin
	}


	;;
	;; Returns the absolute value of Number.
	;; The return value is the same type as Number ( integer or floating point ).
	;;
	abs( _value )
	{
		return Abs( _value )
	}


	;;
	;; Returns Number rounded up to the nearest integer ( without any .00 suffix ).
	;;
	ceil( _value )
	{
		return ceil( _value )
	}


	;;
	;; Returns Number rounded down to the nearest integer ( without any .00 suffix ).
	;;
	floor( _value )
	{
		return floor( _value )
	}


	;;
	;; Returns e ( which is approximately 2.71828182845905 ) raised to the Nth power.
	;; N may be negative and may contain a decimal point. To raise numbers other than e to a power, use the ** operator.
	;;
	exp( _value )
	{
		return exp( _value )
	}


	;;
	;; Returns the logarithm ( base 10 ) of Number.
	;; The result is formatted as floating point. If Number is negative, an empty string is returned.
	;; Note: I don't need to separate out the clauses, but because I am checking for certain instances ie 1, I may as well add a clause to simplify the logic
	;;	if we're using default base 10... etc...
	;;
	log( _value, _base = 10 )
	{
		; Because Base 10 is the default, we'll go ahead and simplify this clause ( log 1 is 0, prevent division by 0 )
		if ( _base == 10 || _base == 1 )
			return log( _value )

		;; Log with base n support so we're not stuck with base 10 and so we don't have to repeat this code each time we want a different base...
		return log( _value ) / log( _base )
	}


	;;
	;; Returns the natural logarithm ( base e ) of Number.
	;; The result is formatted as floating point. If Number is negative, an empty string is returned.
	;;
	ln( _value )
	{
		return ln( _value )
	}


	;;
	;; Returns the remainder when Dividend is divided by Divisor.
	;; The sign of the result is always the same as the sign of the first parameter. If either input is a floating point number, the result is also a floating point number. If the second parameter is zero, the function yields a blank result ( empty string ).
	;;
	mod( _divident, _divisor )
	{
		return mod( _divident, _divisor )
	}


	;;
	;; Returns Number rounded to N decimal places.
	;; If N is omitted or 0, Number is rounded to the nearest integer: MsgBox, % Round( 3.14 )	; Returns 3
	;; If N is positive number, Number is rounded to N decimal places: MsgBox, % Round( 3.14, 1 ) ; Returns 3.1
	;; If N is negative, Number is rounded by N digits to the left of the decimal point: MsgBox, % Round( 345, -1 ) ; Returns 350 -- MsgBox, % Round( 345, -2 ) ; Returns 300
	;;
	round( _value, _decimals = 0 )
	{
		return round( _value, _decimals )
	}


	;;
	;; Returns the square root of Number.
	;; The result is formatted as floating point. If Number is negative, the function yields a blank result ( empty string ).
	;;
	sqrt( _value )
	{
		return sqrt( _value )
	}


	;;
	;; Trigonometry
	;; Note: To convert a radians value to degrees, multiply it by 180/pi ( approximately 57.29578 ).
	;;	To convert a degrees value to radians, multiply it by pi/180 ( approximately 0.01745329252 ).
	;;	The value of pi ( approximately 3.141592653589793 ) is 4 times the arctangent of 1.
	;;


	;;
	;; Returns the trigonometric sine of Number.
	;; Number must be expressed in radians.
	;;
	sin( _value )
	{
		return sin( _value )
	}


	;;
	;; Returns the trigonometric cosine of Number.
	;; Number must be expressed in radians.
	;;
	cos( _value )
	{
		return cos( _value )
	}


	;;
	;; Returns the trigonometric tangent of Number.
	;; Number must be expressed in radians.
	;;
	tan( _value )
	{
		return tan( _value )
	}


	;;
	;; Returns the arcsine ( the number whose sine is Number ) in radians.
	;; If Number is less than -1 or greater than 1, the function yields a blank result ( empty string ).
	;;
	asin( _value )
	{
		return asin( _value )
	}


	;;
	;; Returns the arccosine ( the number whose cosine is Number ) in radians.
	;; If Number is less than -1 or greater than 1, the function yields a blank result ( empty string ).
	;;
	acos( _value )
	{
		return acos( _value )
	}


	;;
	;; Returns the arctangent ( the number whose tangent is Number ) in radians.
	;;
	atan( _value )
	{
		return atan( _value )
	}
 }