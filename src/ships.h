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

#ifndef _SWRIP_SHIPS_H_
#define _SWRIP_SHIPS_H_

#include <utility/vector3.h>
#include "types.h"

ch_ret drive_ship( Character *ch, Ship *ship, Exit *exit, int fall );
void resetship( Ship *ship );
void write_ship_list( void );
void echo_to_docked( int color, Ship *ship, const char *argument );
bool candock( const Ship *ship );
bool ship_is_in_hyperspace( const Ship *ship );
bool ship_is_disabled( const Ship *ship );
bool ship_in_range( const Ship *ship, const Ship *target );
bool ship_in_range_c( const Ship *ship, const Ship *target );
bool missile_in_range( const Ship *ship, const Missile *missile );
bool space_in_range( const Ship *ship, const SPACE_DATA *object );
bool space_in_range_c( const Ship *ship, const SPACE_DATA *object );
bool check_hostile( Ship *ship );
void load_ships( void );
void save_ship( const Ship *ship );
Ship *get_ship( const char *name );
Ship *ship_from_entrance( vnum_t vnum );
Ship *ship_from_hanger( vnum_t vnum );
Ship *ship_from_cockpit( vnum_t vnum );
Ship *ship_from_navseat( vnum_t vnum );
Ship *ship_from_coseat( vnum_t vnum );
Ship *ship_from_pilotseat( vnum_t vnum );
Ship *ship_from_gunseat( vnum_t vnum );
Ship *ship_from_turret( vnum_t vnum );
Ship *ship_from_engine( vnum_t vnum );
Ship *get_ship_here( const char *name , Ship *eShip );
void update_shipmovement( void );
void recharge_ships( void );
void update_ships( void );
bool is_rental( Character *ch , Ship *ship );
void echo_to_ship( int color, Ship *ship, const char *argument );
void echo_to_cockpit( int color, Ship *ship, const char *argument );
void echo_to_nearby_ships( int color, Ship *ship, const char *argument, Ship *ignore );
bool extract_ship( Ship *ship );
bool ship_to_room( Ship *ship, vnum_t vnum );
long get_ship_value( Ship *ship );
bool rent_ship( Character *ch, Ship *ship );
void damage_ship( Ship *ship, Ship *assaulter, int min, int max );
void damage_ship_ch( Ship *ship, int min, int max, Character *ch);
void destroy_ship( Ship *ship , Character *ch );
void ship_to_spaceobject( Ship *ship, SPACE_DATA *spaceobject );
void ship_from_spaceobject( Ship *ship, SPACE_DATA *spaceobject);
Ship *ship_in_room( ROOM_INDEX_DATA *room, const char *name );
void transship( Ship *ship , vnum_t destination );
void dockship( Character *ch, Ship *ship );
bool is_autoflying( const Ship *ship );
bool check_pilot( Character *ch , Ship *ship );

#endif
