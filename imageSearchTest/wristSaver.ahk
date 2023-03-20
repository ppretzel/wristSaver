#include helperFunctions.ahk

autorun:
parseHotkeys("hotkeys.ahk")
return

; Includes for the individual funtions must appear only after the autorun part has finished!
; In order to prevent them from being executed on startup
#include ish.ahk

#Enter::
    MsgBox reloading
    Reload
    return

; Suspend script with Insert
Insert::
    Suspend
    return
