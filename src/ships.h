#ifndef _SWRIP_SHIPS_H_
#define _SWRIP_SHIPS_H_

#include <utility/vector3.h>
#include "types.h"

ch_ret drive_ship( CHAR_DATA *ch, SHIP_DATA *ship, EXIT_DATA *exit, int fall );
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
SHIP_DATA *ship_from_obj( int vnum );
SHIP_DATA *ship_from_entrance( int vnum );
SHIP_DATA *ship_from_hanger( int vnum );
SHIP_DATA *ship_from_cockpit( int vnum );
SHIP_DATA *ship_from_navseat( int vnum );
SHIP_DATA *ship_from_coseat( int vnum );
SHIP_DATA *ship_from_pilotseat( int vnum );
SHIP_DATA *ship_from_gunseat( int vnum );
SHIP_DATA *ship_from_turret( int vnum );
SHIP_DATA *ship_from_engine( int vnum );
SHIP_DATA *get_ship_here( const char *name , SHIP_DATA *eShip );
void update_shipmovement( void );
void recharge_ships( void );
void update_ships( void );
bool is_rental( CHAR_DATA *ch , SHIP_DATA *ship );
void echo_to_ship( int color, SHIP_DATA *ship, const char *argument );
void echo_to_cockpit( int color, SHIP_DATA *ship, const char *argument );
void echo_to_nearby_ships( int color, SHIP_DATA *ship, const char *argument, SHIP_DATA *ignore );
bool extract_ship( SHIP_DATA *ship );
bool ship_to_room( SHIP_DATA *ship, int vnum );
long get_ship_value( SHIP_DATA *ship );
bool rent_ship( CHAR_DATA *ch, SHIP_DATA *ship );
void damage_ship( SHIP_DATA *ship, SHIP_DATA *assaulter, int min, int max );
void damage_ship_ch( SHIP_DATA *ship, int min, int max, CHAR_DATA *ch);
void destroy_ship( SHIP_DATA *ship , CHAR_DATA *ch );
void ship_to_spaceobject( SHIP_DATA *ship, SPACE_DATA *spaceobject );
void ship_from_spaceobject( SHIP_DATA *ship, SPACE_DATA *spaceobject);
SHIP_DATA *ship_in_room( ROOM_INDEX_DATA *room, const char *name );
void transship( SHIP_DATA *ship , int destination );
void dockship( CHAR_DATA *ch, SHIP_DATA *ship );
bool is_autoflying( const SHIP_DATA *ship );
bool check_pilot( CHAR_DATA *ch , SHIP_DATA *ship );

#endif
