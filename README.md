# Treechord

<img src="Treechord.png">

Are you tired of trying to remember which keys to press to access certain features on your computer? Introducing Treechord: the user-friendly key system for Windows that makes it easy to access all of your favorite programs with just a few simple keystrokes.

With Treechord, users can customize their own key combinations to access specific features or perform certain actions on their computer. This can include launching programs, opening files, and more.

Treechord is designed to be easy to use, with a clear and intuitive design that allows users to quickly set up and customize their key combinations. The software also includes a variety of preset key combinations for common actions, making it easy for users to get started right out of the box.

In addition to its user-friendly design, Treechord is also fully compatible with all versions of Windows, making it the perfect tool for anyone looking to streamline their computer usage.

Say goodbye to cluttered desktop icons and complicated key combinations - with Treechord, accessing your favorite features has never been easier. Try Treechord today and start making the most of your computer.

## Details
The Microsoft Windows keybind system lacks any form of customizable options. Your only choice is to assign button presses to individual links or shortcuts. Unfortunately, that's hard to manage, and doesn't scale between systems. Treechord solves this problem by bringing a complete executable that works on all Windows systems.

By design, Treechord doesn't modify any Windows internals, unlike unsuppored modifications that use the registry. Instead, Treechord adds a simple JSON file to your user's home folder, allowing for fast and simple customization without fuddling with source code.

## Specifications
- Supports all (reasonable) versions of Windows.
- 64 and 32-bit compatible.

## Features
- Built on top of Windows; doesn't cause instability; doesn't touch registry, or group policies
- Standalone; no installation.
- Suppored by all keyboards (extended on MS Ergonomic 4000).
- JSON configurable.

## Configuration
The configuration file is in JSON format, with each key representing a keyboard shortcut and the corresponding value representing the program to be launched.

Here is an example of a valid configuration:

        {
        "bindA": "C:\Users\brody\AppData\Roaming\Telegram Desktop\Telegram.exe",
        "bindShiftA": "C:\Users\brody\AppData\Local\Discord\app-1.0.9007\Discord.exe"
        }

In this example, pressing "Windows + A" will launch Telegram, while pressing "Windows + Shift + A" will launch Discord.

## Key Bindings
The keys or key combinations to be bound are specified as strings. Here are some examples of valid key bindings:

"bindA": Binds the Windows + A key combination.

"bindShiftA": Binds the Windows + Shift + A key combination.

## Program Paths
The programs to be launched are specified as file paths. These paths should be absolute and should include the program's executable file.

Here is an example of a valid program path:

        "C:/Users/brody/AppData/Roaming/Telegram Desktop/Telegram.exe"

## Usage
To use the keyboard shortcuts, simply press the bound key or key combination. The corresponding program will be launched.

Note that the keyboard shortcuts will only work if the configuration file is properly loaded by the Treechord.

## FAQ
### "I modified the config. Why are my shortcuts still the same?"
Run **Windows + Ctrl + r**. This reloads the actively running configuration.

### "I messed up my config file. How do I reset it?"
Remove the file, then rerun or reload Treechord.

### Why don't my keybindings work with X, Y, or Z program when running as administrator?
Treechord needs to be run as administrator in order to work with priviledged programs.
