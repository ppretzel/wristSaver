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
	;ClickImage("ishSelektion")
	Send {F6}
	WinWaitActive Selektionsbild zur Belegungsliste
	Sleep 100
	; Send KI123
	return
	
ishShowForms:
	;clickImage("ishForms")
	Send +{F1}
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
	ClickImage("ishLogbuchZiel")
	Sleep 100
	ClickImage("ishLogbuchZentrallabor")
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
	clickImage("laurisKumulativbefund",,, warnIfFailed := False)
	return

ishRezept:
	clickImage("ishUniversalrezept", offsetX := -65, offsetY := 7)
	Sleep 200
	clickImage("ishDrucken")
	WinWaitActive, Universalrezept anlegen
	Sleep 600
	clickImage("ishRezeptierhilfe")
	return
	
ishAufenthaltsbescheinigung:
	clickImage("ishAufenthaltsbescheinigung", OffsetX := -65)
	Sleep 200
	clickImage("ishDrucken")
	return
	
ishBlutprodukte:
	clickImage("ishBlutprodukte", offsetX := -65)
	Sleep 200
	ClickImage("ishDrucken")
	return
	
ishWordZeileLoeschen:
	ControlGetFocus, focusedControl
	if (focusedControl == "_WwG1") {
		Send +{End}
		Send {Backspace}
		;Sleep, 1000
		WinWaitActive, Zellen l 
		;Zellen löschen, der umlaut scheint probleme zu machen
		Send {Down 2}
		}
	return 

ishWordSpalteLoeschen:
	ControlGetFocus, focusedControl
	if (focusedControl == "_WwG1") {
		;Send +{End}
		Send {Backspace}
		WinWaitActive, Zellen l 
		;Zellen löschen, der umlaut scheint probleme zu machen
		Send {Down 3}
		}
	return 

ishDiagnosenliste:
	ClickImage("ishDiagnosenliste")
	WinWaitActive, Diagnosen
	Sleep 200
	ClickImage("ishAmbulanzdiagnose",,, warnIfFailed := True)
	return

ishVerschluesseln:
	ClickImage("ishVerschluesseln")
	WinWaitActive, ahk_class #32770
	Send {Enter}
	return