#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; All coordinates for mouse actions are relative to the window
CoordMode, Mouse, Window
CoordMode, Pixel, Window

SetCapsLockState AlwaysOff

SendMode Event  
SetTitleMatchMode, 1