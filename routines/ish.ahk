#IfWinActive ahk_class SAP_FRONTEND_SESSION

ishBack:
    clickImage("ishBack")
	return

ishSave:
	clickImage("ishSave")
	return
	
ishShowWard:
	ControlFocus SAPTreeList2
	Send {PgUp}
	Send {PgUp}
	Send {PgUp}
	Send {PgUp}
	Send {Down}
	Send {Enter}
	return	

ishShowClinic:
	ControlFocus SAPTreeList2
	Send {PgUp}
	Send {PgUp}
	Send {PgUp}
	Send {PgUp}
	Send {PgDn}
	Send {PgDn}
	Send {Up}
	Send {Up}
	Send {Up}
	Send {Enter}
	return
	
ishChangeSelection:
	ClickImage("ishChangeSelection")
	WinWaitActive Selektionsbild zur Belegungsliste
	Sleep 100
	;Send KI123
	return
	
ishShowForms:
	clickImage("ishForms")
	return
	
ishArztbrief:
	clickImage("ishArztbrief")
	; warte auf dialog "anlegen oder ändern?", 2s timeout wenn neuer Brief angelegt und deshalb nicht gefragt wird
	WinWaitActive, ahk_class #32770,, 2
	Sleep 100
	clickImage("ishArztbriefAendern")
	return

ishFahrauftrag:
	ClickImage("ishFahrauftrag", offsetX := 97)
	Sleep, 500
	ClickImage("ishCitotransport")
	WinWaitActive, LOGBUCH
	Sleep, 1500
	ClickImage("ishLogbuchZiel", OffsetX := 12, OffsetY := 14)
	return

ishPACS:
	clickImage("ishPACS")
	WinWaitActive, ahk_class #32770
	if useNewPACSViewer {
		Send {Down}
	}
	Send {Enter}
	return

ishRoentgenanforderung:
	clickImage("ishRoentgenanforderung")
	WinWaitActive, ahk_class  #32770
	Send, {Enter}
	return

ishLauris:
	clickImage("ishLauris")
	WinWaitActive, LAURIS
	Sleep, 400
	clickImage("laurisBefundansicht")
	Sleep, 300
	clickImage("laurisKumulativbefund")
	return
