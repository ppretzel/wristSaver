#include systemSettings.ahk
#include userSettings.ahk
#include helperFunctions.ahk

autorun:
parseHotkeys("hotkeys.txt")
return

; Includes for the individual funtions must appear only after the autorun part has finished!
; In order to prevent them from being executed on startup
#include routines\global.ahk
#include routines\ish.ahk
