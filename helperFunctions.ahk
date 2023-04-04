clickImage(imageName, offsetX := 0, offsetY := 0)
{
	Sysget, totalWidth, 78
	Sysget, totalHeight, 79
    ImageSearch, foundX, foundY, 0, 0, %totalWidth%, %totalHeight%, % "images\" imageName ".png", *10
    if (ErrorLevel = 1) {
        MsgBox % "Error trying to click " imageName ": Image not found within the currently active window"
        return
    } else if (ErrorLevel > 1) {
        MsgBox % "Error trying to click " imageName ": Other eror (ErrorLevel 2), usually: Image file not found"
        return
    }    
    clickReturn(foundX + offsetX, foundY + offsetY)
}

isPosition(position) {
	return RegExMatch(position, "^\d+,\d+$")
}
 
clickReturn(X, Y=False) {

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

parseHotkeys(filename) {
	if ! FileExist(filename) {
		MsgBox % "Hotkey definitions file " filename " not found!"
	}
    Loop, Read, %filename%, OE
    {	
        if (SubStr(A_LoopReadLine, 1, 1) != ";" && A_LoopReadLine != "")
        {
            OutputArray := StrSplit(A_LoopReadLine, ",")
            if (OutputArray.Length() = 2)
            {
                label := StrReplace(OutputArray[1], A_Space, "")
                ;keycombo := StrReplace(OutputArray[2], A_Space, "")
				keycombo := Trim(OutputArray[2])
                ;MsgBox % "Creating hotkey " keycombo " for label " label
                Hotkey, % keycombo, % label
            } else
            {
                MsgBox, Invalid line: %A_LoopReadLine% (number of items != 2)
            }
        }
    }
}
