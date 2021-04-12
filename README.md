# UltraDocker

This is a simple AutoHotkey script for easy docking of windows, aimed primarily at ultrawide monitors, with aspect ratio 21:9 or higher. To use it, install [AutoHotkey](https://www.autohotkey.com/) on your Windows system and run the file `UltraDocker.ahk`.

By default, the script is triggered using the mouse 4 button, available in most gaming mice. If you do not have a mouse with 4 or more buttons, simply replace `XButton1` in the first line of the script with another key from [the list of available AutoHotkey keys](https://www.autohotkey.com/docs/KeyList.htm). For example, to use the Pause/Break button, which is a good choice since it is almost never used for any other purpose, replace `XButton1` with `Pause` in the first line.

When the trigger button or key is pressed, the currently active window will be docked based on the current location of the mouse:

* If the mouse is in the **left or right third** of the screen, the window will be docked to the left or right respectively, at **50%** of the total width of the screen. This allows docking one window to the left and one to the right, so they can be used in parallel.
* If the mouse is in the **middle third** of the screen, the window will be centered at **60%** of the total width of the screen. This allows having only one window open on the screen, in a convenient location, but without maximizing the window, which often makes it too wide; for example, when using a web browser or a text editor, it is very inconvenient to have the text extend all the way across the screen.
* If the window is maximized, it will be un-maximized first.

![UltraDocker Demo](Demo.gif)

Please note that the script will only be able to dock administrative applications (e.g. Registry Editor) if you run the script itself as administrator. Simply right-click on the script and choose "Run as administrator" from the menu.

To run the script automatically on startup, either create a shortcut to it in `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup` or create a task for it in the Task Scheduler. The latter option is preferred, as it allows you to run the script as administrator on startup without the hassle of the User Account Control (UAC) prompt.

## Version history

* Version 1.0 (2021-04-12)
    * Initial release.

## Feedback

If you would like a request any additional features, or if you encounter any bugs, please feel free to open a new issue!

## Author and copyright

Copyright (c) 2021 [Barak Shoshany](http://baraksh.com) (baraksh@gmail.com). Licensed under the [MIT license](LICENSE.txt).
