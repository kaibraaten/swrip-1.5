# Star Wars: Rise in Power 1.5
## Disclaimer
Before I say anything else, I need to make it clear that I do **_not_** recommend using this code in its current state.

## What am I looking at?
This project is a refactored version of SWRiP 1.0.1. The original code is a prime example of legacy code, with lots of global variables without any kind of access control, everything can be changed freely from anywhere, more code duplication than you can shake your fist at, poorly named variables, functions and structs, unclear structure and architecture, etc. Even minor changes or additions make require little changes in a dozen unrelated places all over the codebase. In short, it's the kind of code that no sane person would touch with a ten foot pole.

## Why would you do this to yourself?
Being a computer science student with a special interest in clean code, cleaning up this mess is a perfect project for me. Identify poor code, and turn it into good (or at least better) code. I'm not saying it'll ever be high quality code, but I've already learned a lot from this project. In particular, I've felt how much tight coupling can hurt.

## Goals
The first goal is to get as much code as possible under test. Because of how tightly coupled everything is, getting unit tests in place requires a great deal of work. Most of the refactoring is governed by this one goal. The single greatest obstacle is dependencies. So breaking dependencies is the name of the game.

Exactly where we go from there is not decided yet. But it will not be adding new features. It will still be about refactoring.

## Requirements
* A version of GCC supporting C++14.
* Lua 5.3
* Google Test and Google Mock

## Compiling
* cd into `src`
* Type `make`

If the linker complains that it can't find _-lgmock_, and you're absolutely certain you have install the Google Mock development files, it's possible you have an older version of Google Mock that doesn't use a library (it's purely in header files). If so, remove references to _-lgmock_ from the Makefiles in all test directories.

If the compiler (or possibly even linker) complains that it can't find lua.h, and you're absolutely sure you've installed the Lua development files, it's possible that your system has the headers in a different location than mine. If so you'll need to add this location to the header and/or library path in the Makefile. How to find the files and how to add the path is beyond this document.

If you get any other compiler errors concerning Lua, it's possible you have an older version of Lua (or possibly even newer). The only version I can say for certain works is 5.3.

If you get any other errors let me know.

## Running the mud
Edit the `startup` script in the top directory and change `port=7000` into whatever port you want the server to listen on.

Type `./startup` and pray.

Log into the game with your favorite mud client, and create a character. You'll need to finish newbie school in order to save your character. After successfully saving, quit the game. Enter the `data/players/first_letter_of_your_character_name` and open the save file. Locate the `Level = 2` variable, and change to `Level = 105`. Save and exit editor. You can now enter the game, and you will be top level admin. Yay.

I'll probably simplify this process at some point.

## Credits
Below is the history of SWRiP.

Star Wars: Rise in Power 1.5 &copy; 2016-2018 by Kai Braaten

Star Wars: Rise in Power 1.0.1 &copy; 2001 by Mark Miller (Darrik Vequir)

Star Wars Reality &copy; 1997 by Sean Cooper

SMAUG 1.0 &copy; 1994, 1995, 1996 by Derek Snider

Merc 2.1 &copy; 1992, 1993 by Michael Chastain, Michael Quan, and Mitchell Tse

Diku Mud &copy; 1990, 1991 by Sebastian Hammer, Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe
