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

#ifndef _SWRIP_TURRET_H_
#define _SWRIP_TURRET_H_

#include "types.h"

TURRET_DATA *create_turret( SHIP_DATA *owner );
void destroy_turret( TURRET_DATA *turret );
TURRET_DATA *copy_turret( const TURRET_DATA *old_turret, SHIP_DATA *owner_of_new_turret );

bool is_turret_installed( const TURRET_DATA *turret );

void reset_turret( TURRET_DATA *turret );

void set_turret_ready( TURRET_DATA *turret );
bool is_turret_ready( const TURRET_DATA *turret );

void set_turret_damaged( TURRET_DATA *turret );
bool is_turret_damaged( const TURRET_DATA *turret );

bool is_turret_recharging( const TURRET_DATA *turret );
void fire_turret( TURRET_DATA *turret );

void clear_turret_target( TURRET_DATA *turret );
void set_turret_target( TURRET_DATA *turret, SHIP_DATA *target );
SHIP_DATA *get_turret_target( const TURRET_DATA *turret );
bool turret_has_target( const TURRET_DATA *turret );

void set_turret_room( TURRET_DATA *turret, vnum_t room_vnum );
vnum_t get_turret_room( const TURRET_DATA *turret );

int get_energy_draw( const TURRET_DATA *turret );

#endif
