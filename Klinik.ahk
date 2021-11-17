; --------------- TODO -------------------
; Hotkeys für alle Programme und Ordner
; Neue Workstation-Definitionen für die wichitsgen Rechner (Samuel, St 13 beidseits, U-Zimmer)
; Automatische Auswahl Workstation basierend auf PC-Name
; Telefonliste durchsuchbar machen? Auf Aufruf öffnen?
; Meona Schnell, neue MEdikation, neue Anordnung, Überwachungsbogen,
; Cheatsheet für alle Hotkeys
; Move settings from this one into settings.ini
; maybe create settings for old/new pacs selection, auto open kumulativbefund in Lauris, etc

#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include HelperFunctions.ahk

WorkplaceDefinitionsFolder := A_ScriptDir . "\WorkplaceDefinitions"
FileSelectFile, definitionsFile, 3, %WorkplaceDefinitionsFolder%, Select Workstation, *.ini
ReadIni(definitionsFile)

; All coordinates for mouse actions are relative to the window
CoordMode, Mouse, Window

SetCapsLockState AlwaysOff

; ------------ GLOBAL --------------------------------

Ins::Suspend Toggle

^q::Send !{f4}

; Vim-Like navigation when holding Caps LOck
CapsLock & j::Down
CapsLock & k::Up
CapsLock & h::Left
CapsLock & l::Right
CapsLock & n::Send {WheelDown 5}
CapsLock & u::Send {WheelUp 5}

; Maximize/Minimize using Win+Mousewheel
#WheelDown::
WinMinimize, A
return
#WheelUp::
WinMaximize, A
return

; Enter/Esc using Win+MouseButtons
#LButton::Send {Enter}
#RButton::Send {Esc}

CapsLock::Send {Esc}

; ------------ ISH --------------------------------
#IfWinActive ahk_class SAP_FRONTEND_SESSION

; Caps-w to go back (click green arrow)
CapsLock & w::ClickReturn(ISHZurueck)
; Caps-s to save
CapsLock & s::ClickReturn(ISHSpeichern)

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

; Faster scrolling
+WheelDown::Send {WheelDown}{WheelDown}{WheelDown}
+WheelUp::Send {WheelUp}{WheelUp}{WheelUp}

; ------------ LAURIS --------------------------------
#IfWinActive LAURIS 

s::ClickReturn(LaurisBefundansicht)
w::ClickReturn(LaurisAuftragserfassung)
e::ClickReturn(LaurisKumulativbefund)
q::ClickReturn(LaurisBefunduebersicht)
a::ClickReturn(LaurisNaechstAktuellerBefund)
+a::ClickReturn(LaurisAktuellereBefunde)
d::ClickReturn(LaurisNaechstAeltererBefund)
+d::ClickReturn(LaurisAeltereBefunde)
