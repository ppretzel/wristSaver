ReadIni( filename = 0 )
; Read a whole .ini file and creates variables like this:
; %Section%%Key% = %value%
{
Local s, c, p, key, k

	if not filename
		filename := SubStr( A_ScriptName, 1, -3 ) . "ini"

	FileRead, s, %filename%

	Loop, Parse, s, `n`r, %A_Space%%A_Tab%
	{
		c := SubStr(A_LoopField, 1, 1)
		if (c="[")
			key := SubStr(A_LoopField, 2, -1)
		else if (c=";")
			continue
		else {
			p := InStr(A_LoopField, "=")
			if p {
				k := SubStr(A_LoopField, 1, p-1)
				%key%%k% := SubStr(A_LoopField, p+1)
			}
		}
	}
}

IsPosition(position) {
	return RegExMatch(position, "^\d+,\d+$")
}
 
ClickReturn(X, Y=False) {

	Local curPosX, curPosY

	MouseGetPos, curPosX, curPosY

	;  If X and Y have been provided as separate variables
	; Bug: This doesnt trigger when Y is set to 0
	If !(Y == False) {
		; Check whether Y really is only one integer
		If Y is digit 
		{
			Click, %X%, %Y% 
		}
		Else {
			Throw "Error in ClickReturn: Variable Y is not an Integer (" . Y . ")" 
		}
	}
	; If the position has been given as a single string
	Else {
		If IsPosition(X) {
			;MsgBox, Clicking %X% 
			Click, %X%
		}
		Else {
			Throw "Not a valid position: " . X
		}
	}
	
	Sleep,100
	
	MouseMove, curPosX, curPosY

}