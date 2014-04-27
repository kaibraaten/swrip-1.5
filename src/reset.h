#ifndef _SWRIP_RESET_H_ 
#define _SWRIP_RESET_H_

#include <utility/utility.h>
#include "types.h"

ROOM_INDEX_DATA *find_room( CHAR_DATA *ch, char *argument, ROOM_INDEX_DATA *pRoom );
void wipe_resets( AREA_DATA *pArea, ROOM_INDEX_DATA *pRoom );
void instaroom( AREA_DATA *pArea, ROOM_INDEX_DATA *pRoom, bool dodoors );
void edit_reset( CHAR_DATA *ch, char *argument, AREA_DATA *pArea, ROOM_INDEX_DATA *aRoom );

#endif
