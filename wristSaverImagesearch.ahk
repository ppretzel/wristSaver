#include systemSettings.ahk
#include userSettings.ahk
#include helperFunctions.ahk

autorun:
parseHotkeys("hotkeys.txt")
MsgBox Hotkeys have been parsed
return

; Includes for the individual funtions must appear only after the autorun part has finished!
; In order to prevent them from being executed on startup

#include routines\global.ahk

#include routines\meona.ahk
#include routines\ish.ahk
#include routines\diacos.ahk
