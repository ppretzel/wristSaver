; --------------- TODO -------------------
; ISH Arztbrief
; ISH Lauris + PACS (mit Viewer-Auswahl)
; Hotkeys für alle Programme und Ordner
; Neue Workstation-Definitionen für die wichitsgen Rechner (Samuel, St 13 beidseits, U-Zimmer)
; ISH schnelleres Scrollen
; ISH Sichern
; Automatische Auswahl Workstation basierend auf PC-Name
; Telefonliste durchsuchbar machen? Auf Aufruf öffnen?

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

; ------------ ISH --------------------------------
#IfWinActive ahk_class SAP_FRONTEND_SESSION

; Ctrl-w to go back (click green arrow)
^w::ClickReturn(ISHZurueck)
; Ctrl-s to save
^s::ClickReturn(ISHSpeichern)

; Open Lauris
^1::
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
