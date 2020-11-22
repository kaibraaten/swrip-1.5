/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _SWRIP_RESET_HPP_
#define _SWRIP_RESET_HPP_

#include <memory>
#include <string>
#include <utility/utility.hpp>
#include "types.hpp"

 /*
  * Reset commands:
  *   '*': comment
  *   'M': read a mobile
  *   'O': read an object
  *   'P': put object in object
  *   'G': give object to mobile
  *   'E': equip object to mobile
  *   'H': hide an object
  *   'B': set a bitvector
  *   'T': trap an object
  *   'D': set state of door
  *   'R': randomize room exits
  *   'S': stop (end of list)
  */

  /*
   * Area-reset definition.
   */
class Reset
{
public:
    std::shared_ptr<Reset> Next;
    std::shared_ptr<Reset> Previous;
    char Command = 0;
    int MiscData = 0;
    int Arg1 = 0;
    int Arg2 = 0;
    int Arg3 = 0;
    const class Plugin *Plugin = nullptr;
};

std::shared_ptr<Room> FindRoom(std::shared_ptr<Character> ch, const std::string &argument, std::shared_ptr<Room> pRoom);
void WipeResets(std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom);
void InstallRoom(std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom, bool dodoors,
    const Plugin *plugin);
void EditReset(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
               std::shared_ptr<Room> aRoom, const Plugin *plugin);
void ResetArea(std::shared_ptr<Area> pArea);
std::string SPrintReset(std::shared_ptr<Character> ch, std::shared_ptr<Reset> pReset, short num, bool rlist);
std::shared_ptr<Reset> MakeReset(char letter, int extra, int arg1, int arg2, int arg3, const Plugin *plugin);
std::shared_ptr<Reset> AddReset(std::shared_ptr<Area> tarea, char letter, int extra,
                                int arg1, int arg2, int arg3, const Plugin *plugin);
std::shared_ptr<Reset> PlaceReset(std::shared_ptr<Area> tarea, char letter,
                                  int extra, int arg1, int arg2, int arg3, const Plugin *plugin);
void RenumberPutResets(std::shared_ptr<Area> pArea);

#endif
