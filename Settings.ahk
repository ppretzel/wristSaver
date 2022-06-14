#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; All coordinates for mouse actions are relative to the window
CoordMode, Mouse, Window

SetCapsLockState AlwaysOff

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, Regex