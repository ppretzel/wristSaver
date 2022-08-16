#include Settings.ahk
#include HelperFunctions.ahk

WorkplaceDefinitionsFolder := A_ScriptDir . "\WorkplaceDefinitions"
; Outdated: used to select a definitions file (= location of buttons), for now all PCs use the same locations
;FileSelectFile, definitionsFile, 3, %WorkplaceDefinitionsFolder%, Select Workstation, *.ini
definitionsFile := WorkplaceDefinitionsFolder "\default.ini"
ReadIni(definitionsFile)

; ------------ GLOBAL --------------------------------

; script execution
Ins::Suspend Toggle
CapsLock & F5::Reload

^q::Send !{f4}

; Directly open programs
CapsLock & y::GroupActivate, ISH
;CapsLock & y::WinActivate, ahk_class SAP_FRONTEND_SESSION
CapsLock & x::WinActivate, Meona:

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

; F12 to open gVim
CapsLock & F12::
if WinExist("GVIM") {
	WinActivate
} else {
	Run "\\nacl2svm1.ukt.ad.local\kipretp1\UserProfile\Desktop\gVimPortable\gVimPortable.exe"	
}
return

; ------------- ISH ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\ish.ahk
#IfWinActive

; ------------- Meona ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\meona.ahk
#IfWinActive

; ------------- Lauris ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\lauris.ahk
#IfWinActive

; ------------- idDiacos ----------------------------------
#include %A_ScriptDir%\AppSpecificDefinitions\idDiacos.ahk
#IfWinActive


