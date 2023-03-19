#include helperFunctions.ahk

autorun:
parseHotkeys("hotkeys.ahk")
return

; Includes for the individual funtions must appear only after the autorun part has finished!
#include ish.ahk

#Enter::
    MsgBox reloading
    Reload
    return

; Suspend script with Insert
Insert::
    Suspend
    return
