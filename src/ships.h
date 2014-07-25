#ifndef _SWRIP_SHIPS_H_
#define _SWRIP_SHIPS_H_

#include <utility/vector3.h>
#include "types.h"

ch_ret drive_ship( Character *ch, SHIP_DATA *ship, Exit *exit, int fall );
void resetship( SHIP_DATA *ship );
void write_ship_list( void );
void echo_to_docked( int color, SHIP_DATA *ship, const char *argument );
void sound_to_ship( SHIP_DATA *ship, const char *argument );
bool candock( const SHIP_DATA *ship );
bool ship_is_in_hyperspace( const SHIP_DATA *ship );
bool ship_is_disabled( const SHIP_DATA *ship );
bool ship_in_range( const SHIP_DATA *ship, const SHIP_DATA *target );
bool ship_in_range_c( const SHIP_DATA *ship, const SHIP_DATA *target );
bool missile_in_range( const SHIP_DATA *ship, const MISSILE_DATA *missile );
bool space_in_range( const SHIP_DATA *ship, const SPACE_DATA *object );
bool space_in_range_c( const SHIP_DATA *ship, const SPACE_DATA *object );
bool check_hostile( SHIP_DATA *ship );
void load_ships( void );
void save_ship( const SHIP_DATA *ship );
SHIP_DATA *get_ship( const char *name );
SHIP_DATA *ship_from_entrance( vnum_t vnum );
SHIP_DATA *ship_from_hanger( vnum_t vnum );
SHIP_DATA *ship_from_cockpit( vnum_t vnum );
SHIP_DATA *ship_from_navseat( vnum_t vnum );
SHIP_DATA *ship_from_coseat( vnum_t vnum );
SHIP_DATA *ship_from_pilotseat( vnum_t vnum );
SHIP_DATA *ship_from_gunseat( vnum_t vnum );
SHIP_DATA *ship_from_turret( vnum_t vnum );
SHIP_DATA *ship_from_engine( vnum_t vnum );
SHIP_DATA *get_ship_here( const char *name , SHIP_DATA *eShip );
void update_shipmovement( void );
void recharge_ships( void );
void update_ships( void );
bool is_rental( Character *ch , SHIP_DATA *ship );
void echo_to_ship( int color, SHIP_DATA *ship, const char *argument );
void echo_to_cockpit( int color, SHIP_DATA *ship, const char *argument );
void echo_to_nearby_ships( int color, SHIP_DATA *ship, const char *argument, SHIP_DATA *ignore );
bool extract_ship( SHIP_DATA *ship );
bool ship_to_room( SHIP_DATA *ship, vnum_t vnum );
long get_ship_value( SHIP_DATA *ship );
bool rent_ship( Character *ch, SHIP_DATA *ship );
void damage_ship( SHIP_DATA *ship, SHIP_DATA *assaulter, int min, int max );
void damage_ship_ch( SHIP_DATA *ship, int min, int max, Character *ch);
void destroy_ship( SHIP_DATA *ship , Character *ch );
void ship_to_spaceobject( SHIP_DATA *ship, SPACE_DATA *spaceobject );
void ship_from_spaceobject( SHIP_DATA *ship, SPACE_DATA *spaceobject);
SHIP_DATA *ship_in_room( ROOM_INDEX_DATA *room, const char *name );
void transship( SHIP_DATA *ship , int destination );
void dockship( Character *ch, SHIP_DATA *ship );
bool is_autoflying( const SHIP_DATA *ship );
bool check_pilot( Character *ch , SHIP_DATA *ship );

#endif
