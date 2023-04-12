meonaPoli:
	Send {F6}
	Sleep 100
	ClickImage("meonaBereichsauswahl")
	ClickImage("meonaAmbulanzen")
	ClickImage("meonaStation")
	return

meonaStation12:
	Send {F6}
	Sleep 100
	ClickImage("meonaBereichsauswahl")
	ClickImage("meonaNeuropaed")
	;ClickImage("meonaStation")
	Send {Enter}
	WinWaitActive, Meona: Station
	ClickImage("meonaStationsauswahl")
	ClickImage("meonaStation12")
	return

meonaStation13:
	Send {F6}
	Sleep 100
	ClickImage("meonaBereichsauswahl")
	ClickImage("meonaNeuropaed")
	ClickImage("meonaStation")
	WinWaitActive, Meona: Station
	ClickImage("meonaStationsauswahl")
	ClickImage("meonaStation13")
	return
	
meonaStation14:
	Send {F6}
	Sleep 100
	ClickImage("meonaBereichsauswahl")
	ClickImage("meonaHaematologie")
	ClickImage("meonaStation")
	WinWaitActive, Meona: Station
	ClickImage("meonaStationsauswahl")
	ClickImage("meonaStation14")
	return
	
meonaStation18:
	Send {F6}
	Sleep 100
	ClickImage("meonaBereichsauswahl")
	ClickImage("meonaHaematologie")
	ClickImage("meonaStation")
	WinWaitActive, Meona: Station
	ClickImage("meonaStationsauswahl")
	ClickImage("meonaStation18")
	return
	
meonaTextbaustein:
	Send {F3}
	Send {End}
	return