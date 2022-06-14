; --------------- TODO -------------------
; Hotkeys für alle Programme und Ordner
; Telefonliste durchsuchbar machen? Auf Aufruf öffnen? Dann aber zuerst die aktuelle Liste schicken lassen
; Cheatsheet für alle Hotkeys
; Move settings from this one into settings.ini
; Station wechseln in ISH und Meona
; PACS etc Buttons sind verändert in der Briefbearbeitungs-Ansicht :/

#include Settings.ahk
#include HelperFunctions.ahk

WorkplaceDefinitionsFolder := A_ScriptDir . "\WorkplaceDefinitions"
; Outdated: used to select a definitions file (= location of buttons), for now all PCs use the same locations
;FileSelectFile, definitionsFile, 3, %WorkplaceDefinitionsFolder%, Select Workstation, *.ini
definitionsFile := WorkplaceDefinitionsFolder "\default.ini"
ReadIni(definitionsFile)

; ------------ GLOBAL --------------------------------

Ins::Suspend Toggle
CapsLock & F5::Reload

^q::Send !{f4}

; Vim-Like navigation when holding Caps Lock
CapsLock & j::Down
CapsLock & k::Up
CapsLock & h::Left
CapsLock & l::Right
CapsLock & n::Send {WheelDown 5}
CapsLock & u::Send {WheelUp 5}

; Enter/Esc using Win+MouseButtons
CapsLock & RButton::Send {Esc}
CapsLock & LButton::Send {Enter}

; ------------- ISH ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\ish.ahk
#IfWinActive

; ------------- Meona ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\meona.ahk
#IfWinActive

; ------------- Lauris ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\lauris.ahk
#IfWinActive

