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

Turret *create_turret( Ship *owner );
void destroy_turret( Turret *turret );
Turret *copy_turret( const Turret *old_turret, Ship *owner_of_new_turret );

bool is_turret_installed( const Turret *turret );

void reset_turret( Turret *turret );

void set_turret_ready( Turret *turret );
bool is_turret_ready( const Turret *turret );

void set_turret_damaged( Turret *turret );
bool is_turret_damaged( const Turret *turret );

bool is_turret_recharging( const Turret *turret );
void fire_turret( Turret *turret );

void clear_turret_target( Turret *turret );
void set_turret_target( Turret *turret, Ship *target );
Ship *get_turret_target( const Turret *turret );
bool turret_has_target( const Turret *turret );

void set_turret_room( Turret *turret, vnum_t room_vnum );
vnum_t get_turret_room( const Turret *turret );

int get_energy_draw( const Turret *turret );

#endif
