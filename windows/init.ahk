; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; From now on whenever you run AutoHotkey directly, this script will be
; loaded.  So feel free to customize it to suit your needs.

; Program Launchers
; #e::Run "C:\Program Files\Vim\vim73\gvim.exe"
#e::Run "C:\home\devel\sublimetext-2b\sublime_text.exe"
#t::Run "C:\cygwin\bin\mintty.exe" -
; #f::Run "C:\Program Files\Double Commander\doublecmd.exe"
#f::Run "C:\Program Files\FreeCommander\FreeCommander.exe"
#w::Run "C:\Documents and Settings\JAguililla\Local Settings\Application Data\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files
#x::WinClose, Program Manager

; Window Cycle
LAlt & SC00C::ShiftAltTab
LAlt & SC00D::AltTab
LAlt & WheelUp::ShiftAltTab
LAlt & WheelDown::AltTab

; Window Operations
LAlt & SC033::WinMinimize, A
LAlt & SC034::WinMaximize, A
LAlt & SC035::WinRestore, A
LAlt & BS::WinClose, A
LAlt & MButton::WinClose, A

; Make CapsLock another Esc. Shift + CapsLock does the previous behaviour
Capslock::
Suspend On
SetCapsLockState, Off
Send, {Esc}
Suspend Off
return

Esc::
Suspend On
SetCapsLockState, Off
Send, {Esc}
Suspend Off
return
