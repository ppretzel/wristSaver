clickImage(imageName, offsetX := 0, offsetY := 0, warnIfFailed := True)
{
	Sysget, totalWidth, 78
	Sysget, totalHeight, 79
    ImageSearch, foundX, foundY, 0, 0, %totalWidth%, %totalHeight%, % "images\" imageName ".png", *10
	if warnIfFailed {
		if (ErrorLevel = 1) {
			MsgBox % "Error trying to click " imageName ": Image not found within the currently active window"
			return
		} else if (ErrorLevel > 1) {
			MsgBox % "Error trying to click " imageName ": Other eror (ErrorLevel 2), usually: Image file not found"
			return
		}   
	}
	if (ErrorLevel = 0) {
		clickReturn(foundX + offsetX, foundY + offsetY)
		return
	}
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
	global msgBoxForEachHotkey
	if ! FileExist(filename) {
		MsgBox % "Hotkey definitions file " filename " not found!"
	}
    Loop, Read, %filename%, OE
    {	
		if (SubStr(A_LoopReadLine, 1, 1) != ";" && A_LoopReadLine != "") {
			; Kontext-sensitive Hotkeys entsprechend https://www.autohotkey.com/docs/v1/lib/Hotkey.htm#IfWin
			if (SubStr(A_LoopReadLine, 1, 5) = "##if ") {
				content := SubStr(A_LoopReadLine, 5)
				;MsgBox Kontext! %content%
				OutputArray := StrSplit(content, ",")
				if (OutputArray.Length() = 2) {
					keyword := Trim(OutputArray[1])
					argument := Trim(OutputArray[2])
					if (keyword = "title") {
						Hotkey, IfWinActive, %argument%
					} else if (keyword = "class") {
						Hotkey, IfWinActive, ahk_class %argument%
					} else {
						MsgBox unrecognized keyword: %keyword%
					}
				} else {
					MsgBox, Invalid line: %A_LoopReadLine%
				}
			} else if (SubStr(A_LoopReadLine, 1, 8) = "##global") {
				;msgBox Kontext global
				Hotkey, IfWinActive
			} else {
				OutputArray := StrSplit(A_LoopReadLine, ",")
				if (OutputArray.Length() = 2)
				{
					label := StrReplace(OutputArray[1], A_Space, "")
					;keycombo := StrReplace(OutputArray[2], A_Space, "")
					keycombo := Trim(OutputArray[2])
					if %msgBoxForEachHotkey% {
						MsgBox % "Creating hotkey " keycombo " for label " label
					}
					Hotkey, % keycombo, % label
				} else
				{
					MsgBox, Invalid line: %A_LoopReadLine% (number of items != 2)
				}
			}
		}
    }
}
