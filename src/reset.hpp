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
  Reset *Next = nullptr;
  Reset *Previous = nullptr;
  char Command = 0;
  int MiscData = 0;
  int Arg1 = 0;
  int Arg2 = 0;
  int Arg3 = 0;
};


Room *FindRoom( const Character *ch, const std::string &argument, Room *pRoom );
void WipeResets( Area *pArea, Room *pRoom );
void InstallRoom( Area *pArea, Room *pRoom, bool dodoors );
void EditReset( Character *ch, std::string argument, Area *pArea, Room *aRoom );
void ResetArea( Area *pArea );
std::string SPrintReset( const Character *ch, Reset *pReset, short num, bool rlist );
Reset *MakeReset( char letter, int extra, int arg1, int arg2, int arg3 );
Reset *AddReset( Area *tarea, char letter, int extra,
		  int arg1, int arg2, int arg3 );
Reset *PlaceReset( Area *tarea, char letter,
		    int extra, int arg1, int arg2, int arg3 );
void RenumberPutResets( Area *pArea );

#endif
