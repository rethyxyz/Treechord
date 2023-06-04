# Treechord
<img src="Treechord.ico">

The Microsoft Windows keybind system lacks any form of customizability. Your only choice is to assign button presses to individual links or shortcuts. Unfortunately, this is hard to manage, and doesn't scale between systems. Treechord solves this problem by bringing a single executable file that works on all Windows systems.

By design, Treechord doesn't modify any Windows internals, unlike unsuppored modifications that use the registry. Instead, Treechord adds a simple JSON file to your user's home folder, allowing for fast and simple customization without fuddling with complex source code.

## Specifications
- Supports all (reasonable) versions of Windows.
- 64-bit builds available.

## Features
- Built on top of Windows; doesn't cause instability; doesn't touch registry, or group policies
- Standalone; no installation.
- Suppored by all keyboards (extended on MS Ergonomic 4000).
- JSON configurable.

## Usage
To use the keyboard shortcuts, simply press the bound key or key combination. The corresponding program will be launched.

To run Treechord, run `Treechord.ahk`, or the `Treechord-x64-windows.exe` file.

**Note**: The keyboard shortcuts will only work if the configuration file is properly loaded by Treechord.

## Configuration
The configuration file is in JSON format, with each key representing a keyboard shortcut and the corresponding value representing the program to be launched.

Here is an example of a valid configuration:

    {
        "bindA": "C:/Users/weiwuer/AppData/Roaming/Telegram Desktop/Telegram.exe",
        "bindShiftA": "C:/Users/weiwuer/AppData/Local/Discord/app-1.0.9007/Discord.exe",
        "bindAltA": "C:/Users/Brody/AppData/Local/Microsoft/WindowsApps/SpotifyAB.SpotifyMusic_zpdnekdrzrea0/Spotify.exe"
    }

In this example, pressing `"Windows + A"` will launch Telegram, `"Windows + Shift + A"` will launch Discord, and `"Windows + Alt + A"` will launch Spotify.

### Key Bindings
The keys or key combinations to be bound are specified as strings. Here are some examples of valid key bindings:

`"bindB"`: Binds the `Windows + B` key combination.
`"bindShiftB"`: Binds the `Windows + Shift + B` key combination.
`"bindAltB"`: Binds the `Windows + Alt + B` key combination.

### Program Paths
The programs to be launched are specified as file paths. These paths should be absolute and should include the program's executable file.

Here is an example of a valid program path:

    "C:/Users/weiwuer/AppData/Roaming/Telegram Desktop/Telegram.exe"

**Note**: Use / (forward slashes) instead of \ (backslashes). If you must use backslashes, use \\ for proper Treechord interpretation.