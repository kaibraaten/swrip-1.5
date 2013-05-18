#ifndef _SWRIP_SHIPS_H_
#define _SWRIP_SHIPS_H_

#include <utility/vector3.h>
#include "types.h"

ch_ret drive_ship( CHAR_DATA *ch, SHIP_DATA *ship, EXIT_DATA *exit, int fall );
void resetship( SHIP_DATA *ship );
void write_ship_list( void );
void echo_to_docked( int color, SHIP_DATA *ship, const char *argument );
void sound_to_ship( SHIP_DATA *ship, const char *argument );
bool candock( SHIP_DATA *ship );

#endif
