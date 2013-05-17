#ifndef _SWRIP_SHIPS_H_
#define _SWRIP_SHIPS_H_

#include <utility/vector3.h>
struct ship_data;

void resetship( struct ship_data *ship );
void write_ship_list( void );
void echo_to_docked( int color, struct ship_data *ship, const char *argument );
void sound_to_ship( struct ship_data *ship, const char *argument );

#endif
