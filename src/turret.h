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

void set_turret_room( TURRET_DATA *turret, int room_vnum );
int get_turret_room( const TURRET_DATA *turret );

int get_energy_draw( const TURRET_DATA *turret );

#endif
