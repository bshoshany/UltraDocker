; UltraDocker v1.0 (2021-04-12)
; By Barak Shoshany (baraksh@gmail.com) (http://baraksh.com)
; GitHub repository: https://github.com/bshoshany/UltraDocker

; When the trigger (by default, mouse button 4) is pressed, dock the window to the left, center, or right, depending on the current location of the mouse.
XButton1::
    ; Get the unique ID (HWND) of the active window.
    window := WinExist("A")
    ; Restore the window if it is maximized, since resizing a maximized window may lead to unexpected results.
    WinGet, is_min_max, MinMax, ahk_id %window%
    If (is_min_max != 0)
    {
        WinRestore, ahk_id %window%
    }
    ; Get the total work area, i.e. the size of the screen minus the taskbar.
    SysGet, area, MonitorWorkArea
    screen_width := areaRight - areaLeft
    screen_height := areaBottom - areaTop
    ; Find the current x position of the mouse on the screen.
    CoordMode, Mouse, Screen
    MouseGetPos, x
    ; Find the size of the window's borders by comparing the x position of the mouse with respect to the entire window and with respect to just the window's client area, which excludes the borders.
    CoordMode, Mouse, Window
    MouseGetPos, x1, , A
    CoordMode, Mouse, Client
    MouseGetPos, x2, , A
    border_x := x1 - x2
    ; Calculate the new height of the resized window.
    height := screen_height + border_x
    ; Dock the window based on which third of the screen the mouse is located in.
    If (x < screen_width / 3)
    {
        ; Dock to the left at 50% screen width.
        width := (screen_width / 2) + (2 * border_x)
        left := -border_x
    }
    Else If (x > screen_width * 2 / 3)
    {
        ; Dock to the right at 50% screen width.
        width := (screen_width / 2) + (2 * border_x)
        left := screen_width - width + border_x
    }
    Else
    {
        ; Dock to the center at 60% screen width.
        width := (screen_width * 0.6) + (2 * border_x)
        left := (screen_width - width) / 2
    }
    ; Move the window to the desired position with the desired size.
    WinMove, ahk_id %window%, , %left%, 0, %width%, %height%
    Return
