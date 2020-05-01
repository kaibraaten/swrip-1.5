# Star Wars: Rise in Power 1.5
## Disclaimer
Before I say anything else, I need to make it clear that I do **_not_**
recommend using this code in its current state.

## What am I looking at?
This project is a refactored version of SWRiP 1.0.1. The original code is a
prime example of legacy code, with lots of global variables without any kind
of access control, everything can be changed freely from anywhere, more code
duplication than you can shake your fist at, poorly named variables, functions
and structs, unclear structure and architecture, etc. Even minor changes or
additions require little changes in a dozen unrelated places all over
the codebase. In short, it's the kind of code that no sane person would touch
with a ten foot pole.

## Why would you do this to yourself?
Being a computer science student with a special interest in clean code,
cleaning up this mess is a perfect project for me. Identify poor code, and
turn it into good (or at least better) code. I'm not saying it'll ever be high
quality code, but I've already learned a lot from this project. In particular,
I've felt how much tight coupling can hurt.

## Goals
The first goal is to get as much code as possible under test. Because of how
tightly coupled everything is, getting unit tests in place requires a great
deal of work. Most of the refactoring is governed by this one goal. The single
greatest obstacle is dependencies. So breaking dependencies is the name of the
game.

Exactly where we go from there is not decided yet, but I'm unlikely to add
new features any time soon. It will still be about refactoring.

## Requirements
* A compiler supporting C++17. Clang, GCC 9, and Visual Studio 2019 are known to work.
* Lua 5.3 (included in libs/3rdparty directory)
* Google Test and Google Mock (downloaded automatically)
* cmake 3.10 or higher.
* Python 3 (the script also works with Python 2, but the v3 interpreter is the one being used).

## Compiling
* Type `cmake .` (only needed first time you're compiling)
* Type `make`

If you get any errors let me know.

*Tip: Try `make -jn` where `n` is the number of cores on your CPU, for instance
`make -j4` to speed up compiling considerably.*

## Running the mud
Edit the `startup` script in the top directory and change `port=7000` into
whatever port you want the server to listen on.

Type `./startup` and pray.

Log into the game with your favorite mud client, and create a character.
You'll need to finish newbie school in order to save your character. After
successfully saving, quit the game. Enter the
`data/players/first_letter_of_your_character_name` directory and open the save
file. Locate the `Level = 1` variable, and change to `Level = 105`. Save and
exit editor. You can now enter the game, and you will be top level admin. Yay.

I'll probably simplify this process at some point.

## Credits
Below is the history of SWRiP.

Star Wars: Rise in Power 1.5 &copy; 2016-2020 by Kai Braaten

Star Wars: Rise in Power 1.0.1 &copy; 2001 by Mark Miller (Darrik Vequir)

Star Wars Reality &copy; 1997 by Sean Cooper

SMAUG 1.0 &copy; 1994, 1995, 1996 by Derek Snider

Merc 2.1 &copy; 1992, 1993 by Michael Chastain, Michael Quan, and Mitchell Tse

Diku Mud &copy; 1990, 1991 by Sebastian Hammer, Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe
