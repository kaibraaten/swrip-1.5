#ifndef _SWRIP_RESET_H_ 
#define _SWRIP_RESET_H_

#include <utility/utility.h>

struct room_index_data;
struct char_data;
struct area_data;

struct room_index_data *find_room( struct char_data *ch, char *argument,
				   struct room_index_data *pRoom );
void wipe_resets( struct area_data *pArea, struct room_index_data *pRoom );
void instaroom( struct area_data *pArea, struct room_index_data *pRoom, bool dodoors );
void edit_reset( struct char_data *ch, char *argument, struct area_data *pArea,
                 struct room_index_data *aRoom );

#endif
