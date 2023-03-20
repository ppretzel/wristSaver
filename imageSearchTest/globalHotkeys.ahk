; Global hotkeys

#Enter::
    MsgBox reloading
    Reload
    return

Insert:: Suspend Toggle

^q::Send !{f4}

; Vim-Like navigation when holding Caps Lock
CapsLock & j::Down
CapsLock & k::Up
CapsLock & h::Left
CapsLock & l::Right
CapsLock & n::Send {WheelDown 5}
CapsLock & u::Send {WheelUp 5}

; Enter/Esc using Caps+MouseButtons
CapsLock & RButton::Send {Esc}
CapsLock & LButton::Send {Enter}
