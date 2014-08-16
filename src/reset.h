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

#ifndef _SWRIP_RESET_H_ 
#define _SWRIP_RESET_H_

#include <utility/utility.h>
#include "types.h"

ROOM_INDEX_DATA *FindRoom( Character *ch, char *argument, ROOM_INDEX_DATA *pRoom );
void WipeResets( Area *pArea, ROOM_INDEX_DATA *pRoom );
void InstallRoom( Area *pArea, ROOM_INDEX_DATA *pRoom, bool dodoors );
void EditReset( Character *ch, char *argument, Area *pArea, ROOM_INDEX_DATA *aRoom );
void ResetArea( Area *pArea );
char *SPrintReset( Character *ch, Reset *pReset, short num, bool rlist );
Reset *MakeReset( char letter, int extra, int arg1, int arg2, int arg3 );
Reset *AddReset( Area *tarea, char letter, int extra,
		  int arg1, int arg2, int arg3 );
Reset *PlaceReset( Area *tarea, char letter,
		    int extra, int arg1, int arg2, int arg3 );
void RenumberPutResets( Area *pArea );

#endif
