#ifndef _SWRIP_TRACK_H_
#define _SWRIP_TRACK_H_

#include "types.h"

#define BFS_ERROR          -1
#define BFS_ALREADY_THERE  -2
#define BFS_NO_PATH        -3
#define BFS_MARK         BV01

int find_first_step(ROOM_INDEX_DATA *src, ROOM_INDEX_DATA *target, int maxdist );

#endif
