; ------------ Meona ----------------------------------------------------------------

; ------------ Kurvenfenster --------------------------------------------------------
#IfWinActive Kurve.*kipretp1.* 

;Kurve/Überwachung
CapsLock & q::ClickReturn(MeonaUeberwachung)
;Anordnungen
CapsLock & w::ClickReturn(MeonaAnordnungen)
;Ärzte
CapsLock & e::ClickReturn(MeonaAerzte)
;Pflege
CapsLock & r::!p

;Anamnese speichern
^s::ClickReturn(MeonaAnamneseSpeichern)

; Move Chart with Horizontal Thumb Scroll Wheel
WheelLeft::
CapsLock & WheelDown::
ClickReturn(MeonaZweiTageVor)
Sleep, 750
return
WheelRight::
CapsLock & WheelUp::
ClickReturn(MeonaZweiTageZurueck)
Sleep, 750
return

;Schnelle Verordnung:
CapsLock & Space::ClickReturn(MeonaSchnell)
;Muss ganz unten stehen! Schnelle Anforderung, gleich weiterschreiben
#IfWinActive SchnelleVerordnung*
Enter::
Send, {Enter}
WinActivate, Schnelle Verordnung
return

; --------- Kurven- und Stationsfenster: Station wählen -------------------------------

#If WinActive("Kurve.*Pablo Pretzel.*") || WinActive("Meona:.*Pablo Pretzel.*")

;Poli
CapsLock & 1::
Send {F6}
WinWaitActive Meona
Send {Home}
Send {Down 3}
Send {Enter}
return

;12
CapsLock & 2::
Send {F6}1
Send {Home}
Send {Down 4}
Send {Enter}
Send {Up}
return

;13
CapsLock & 3::
Send {F6}
Send {Home}
Send {Down 4}
Send {Enter}
return

;14
CapsLock & 4::
Send {F6}
Send {Home}
Send {Down 2}
Send {Enter}
Send {Home}
return

;15
CapsLock & 5::
Send {F6}
Send {Home}
Send {Down 2}
Send {Enter}
Send {Home}
Send {Down}
return

;18
CapsLock & 6::
Send {F6}
Send {Home}
Send {Down 2}
Send {Enter}
Send {End}
return