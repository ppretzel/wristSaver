; ------------ ISH ---------------------------------------------------------------- 
#IfWinActive ahk_class SAP_FRONTEND_SESSION


; Caps-w to go back (click green arrow)
CapsLock & w::ClickReturn(ISHZurueck)
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

; Open Lauris
CapsLock & 4::
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

; Formulare öffnen
CapsLock & f::
Send +{F1}
WinWaitActive, Formularliste
Sleep, 200
ControlFocus SAPALVGrid1
return

; Faster scrolling
+WheelDown::Send {WheelDown}{WheelDown}{WheelDown}
+WheelUp::Send {WheelUp}{WheelUp}{WheelUp}

; ----------------- Speziell für die Poli-Ansicht -----------------------------------
#IfWinActive ahk_class SAP_FRONTEND_SESSION
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

; Open Lauris
CapsLock & 4::
ClickReturn(ISHLaurisPoli)
WinWaitActive, LAURIS
Sleep, 400
ClickReturn(LaurisBefundansicht)
Sleep, 300
ClickReturn(LaurisKumulativbefund)
return

; ; ----------------- Speziell in der Formular-Ansicht ---------------------------------- 
#IfWinActive Formularliste

; Rezepte
r::
Send {Down 10}
Sleep, 100
Send {Space}
Sleep, 1000
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
Send {Down 11}
Send {Space}
Sleep, 100
Send ^p
return

