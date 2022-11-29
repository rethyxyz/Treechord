# Treechord

<img src="Treechord.png">

A user friendly key system for Windows.

The Microsoft Windows keybind system lacks any form of customizable options. Your only choice is to assign button presses to individual links or shortcuts. Unfortunately, that's hard to manage, and doesn't scale between systems. Treechord solves this problem by bringing a complete executable that works on all Windows systems.

By design, Treechord doesn't modify any Windows internals, unlike unsuppored modifications that use the registry. Instead, Treechord adds a simple, plain text JSON file to your user's folder, allowing for fast and simple customization without fuddling with source code.

# Specifications
- Windows Vista, 7, 8, 8.1, 10, and 11 compatible.
- 64 and 32-bit compatible.

# Features
- Built on top of Windows; doesn't cause instability; doesn't touch registry, or group policies
- Standalone; no installation.
- Suppored by all keyboards (extended on MS Ergonomic 4000).
- JSON configurable.

## JSON Configuration
The default configuration file is created at ~/Treechord.json (where ~ is your user's home directory). Your default configuration file will look something like this.

        {
            "bindA": "",
            "bindShiftA": ""
        }

`bindA` means the key `a`, and `bindShiftA` means the key A (note the difference between capitalization).

In your file, there will be a list of all possible bindable keys in that file. In this case, it's shortened for brevity.

Imagine you want to add Discord to `bindShiftA` and Telegram to `bindA`. For this task, you'll need the executable path. If you already know how, you can skip the explanation. If not, here's how you'd set this up:

- Hit the *Start* button
- Search for *telegram*
- Right Click -> *Open File Location*
- Right click the shortcut that's selected in the explorer window that appears -> *Open File Location* once again.
- Shift + Right click the selected executable, and choose *Copy as path*.

Paste this path into the JSON key value like so:

        "bindA": "C:\\Users\\brody\\AppData\\Roaming\\Telegram Desktop\\Telegram.exe"

Make sure you change the single \ (back slashes) to \\\\ (double black slashes). Then, repeat the same process as before.

Paste this path into the JSON key value like so:

        "bindShiftA": "C:\\Users\\brody\\AppData\\Local\\Discord\\app-1.0.9007\\Discord.exe"

Now, if we put it all together...

        {
            "bindA": "C:\\Users\\brody\\AppData\\Roaming\\Telegram Desktop\\Telegram.exe",
            "bindShiftA": "C:\\Users\\brody\\AppData\\Local\\Discord\\app-1.0.9007\\Discord.exe"
        }

Now, if you restart Treechord (Windows + Ctrl + r), try running pressing those keys once again. You'll see that they either run if they're closed, or are raised if they are opened.

# FAQ
## "I modified the config. Why are my shortcuts still the same?"
Run **Windows + Ctrl + r**. This reloads the actively running configuration.

## "I messed up my config file. How do I reset it?"
Remove the file, then rerun or reload Treechord.

## Why don't my keybindings work with X, Y, or Z program when running as administrator?
Treechord needs to be run as administrator in order to work with priviledged programs.
