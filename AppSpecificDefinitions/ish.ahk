; ------------ ISH ---------------------------------------------------------------- 
#IfWinActive ahk_class SAP_FRONTEND_SESSION


; Caps-w to go back (click green arrow)
CapsLock & w::ClickReturn(ISHZurueck)
^!+F1::ClickReturn(ISHZurueck)
; Caps-s to save
CapsLock & s::ClickReturn(ISHSpeichern)

;Station anzeigen
CapsLock & q::
ControlFocus SAPTreeList2
Send {PgUp}
Send {PgUp}
Send {PgUp}
Send {PgUp}
Send {Down}
Send {Enter}
return

;Poli anzeigen
CapsLock & a::
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

;Selektion Ändern
CapsLock & Tab::
ClickReturn(ISHSelektionAendern)
WinWaitActive Selektionsbild zur Belegungsliste
Sleep 100
ClickReturn(ISHSelektionAendernStation)
Send ^a
return

; Formulare öffnen
CapsLock & f::
WinGetTitle, activeWinTitle
if (InStr(activeWinTitle, "Arzt auf Station") > 0) {
	Formularmodus := "Station"
} else if (InStr(activeWinTitle, "KI3 Poliklinik") > 0) {
	Formularmodus := "Poli"
}
Send +{F1}
WinWaitActive, Formularliste
Sleep, 200
ControlFocus SAPALVGrid1
return

;---------------------------------- Nur in der Stationsübersicht -------------------------------------
#IfWinActive Arzt auf Station Pablo Pretzel

; Open Arztbrief
CapsLock & 1::
ClickReturn(ISHArztbrief)
WinWaitActive, ahk_class #32770
ClickReturn(ISHArztbriefAendern)
return

; Create Fahrauftrag
CapsLock & 2::
ClickReturn(ISHFahrauftrag)
Sleep, 1300
ClickReturn(ISHCitotransport)
WinWaitActive, LOGBUCH
Sleep, 3000
ClickReturn(LOGBUCHAuswahl)
Sleep, 50
ClickReturn(LOGBUCHZentrallabor)
return

; Open PACS
CapsLock & 3::
ClickReturn(ISHPacs)
WinWaitActive, ahk_class #32770
Send {Down}
Send {Enter}
return

; Open Röntgenportal
CapsLock & 4::
ClickReturn(ISHRoeAnfStation)
WinWaitActive, ahk_class  #32770
Send, {Enter}
return

; Open Lauris
CapsLock & 5::
ClickReturn(ISHLauris)
WinWaitActive, LAURIS
Sleep, 400
ClickReturn(LaurisBefundansicht)
Sleep, 300
ClickReturn(LaurisKumulativbefund)
return

; Select Ward TODO, for now its only one
CapsLock & t::
ClickReturn(ISHSelektionAendern)
WinWaitActive, ahk_class #32770
ClickReturn(ISHSelektionAendernStation)
Sleep, 100
SendInput, ^a
SendInput, KI3S33
Sleep, 100
Send, {Enter}
return

; Faster scrolling
+WheelDown::Send {WheelDown}{WheelDown}{WheelDown}
+WheelUp::Send {WheelUp}{WheelUp}{WheelUp}

; ----------------- Speziell für die Poli-Ansicht -----------------------------------
#IfWinActive KI3 Poliklinik

; Open Arztbrief
CapsLock & 1::
ClickReturn(ISHArztbriefPoli)
WinWaitActive, ahk_class #32770
ClickReturn(ISHArztbriefAendern)
return

; Create Fahrauftrag
CapsLock & 2::
ClickReturn(ISHFahrauftragPoli)
Sleep, 1300
ClickReturn(ISHCitotransportPoli)
WinWaitActive, LOGBUCH
Sleep, 3000
ClickReturn(LOGBUCHAuswahl)
Sleep, 50
ClickReturn(LOGBUCHZentrallabor)
return

; Open PACS
CapsLock & 3::
ClickReturn(ISHPacsPoli)
WinWaitActive, ahk_class #32770
Send {Down}
Send {Enter}
return

; Open Röntgenportal
CapsLock & 4::
ClickReturn(ISHRoeAnfPoli)
WinWaitActive, ahk_class  #32770
Send, {Enter}
return

; Open Lauris
CapsLock & 5::
ClickReturn(ISHLaurisPoli)
WinWaitActive, LAURIS
Sleep, 400
ClickReturn(LaurisBefundansicht)
Sleep, 300
ClickReturn(LaurisKumulativbefund)
return

; Open idDiacos Diagnosetool
CapsLock & d::ClickReturn(ISHDiagnosen)

; ; ----------------- Speziell in der Formular-Ansicht ---------------------------------- 
; Wurde über Caps-F bereits geöffnet und der Fokus auf die Liste gesetzt
#IfWinActive Formularliste

; Rezepte
r::
if (Formularmodus = "Station") {
	Send {Down 10}
} else if (Formularmodus = "Poli") {
	Send {Down 9}
} else { 
return
}
Sleep, 100
Send {Space}
Sleep, 500
Send ^p
WinWaitActive, Universalrezept anlegen
ClickReturn(ISHRezeptierhilfe)
return

; Aufenthaltsbescheinigung
a::
Send {Space}
Sleep, 100
Send {Enter}
return

; Blutprodukte
b::
if (Formularmodus = "Station") {
	Send {Down 11}
} else if (Formularmodus = "Poli") {
	Send {Down 10}
} else { 
return
}
Sleep, 100
Send {Space}
Sleep, 500
Send ^p
return

; ----------------- Speziell im Word-Fenster bei der Briefschreibung ------------------------
#IfWinActive ahk_class SAP_FRONTEND_SESSION

; In einer Tabelle, z.B. über Lauris eingefügte Laborwerte, die aktuell ausgewählte(n) Zeile(n) löschen
CapsLock & r::
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

; In einer Tabelle, z.B. über Lauris eingefügte Laborwerte, die aktuell ausgewählte(n) Spalten(n) löschen
CapsLock & c::
ControlGetFocus, focusedControl
if (focusedControl == "_WwG1") {
	;Send +{End}
	Send {Backspace}
	WinWaitActive, Zellen l 
	;Zellen löschen, der umlaut scheint probleme zu machen
	Send {Down 3}
	}
return 

; ----------------- Speziell in der Diagnosenübersicht ------------------------
#IfWinActive Diagnosen*

CapsLock & v::
ClickReturn(ISHVerschluesseln)
WinWaitActive, ahk_class #32770
Send {Enter}
return
