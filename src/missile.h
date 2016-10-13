#ifndef _SWRIP_MISSILE_H_
#define _SWRIP_MISSILE_H_

#include <utility/vector3.h>

#include "types.h"

extern Missile *FirstMissile;
extern Missile *LastMissile;

bool UpdateMissile( Missile *missile, void *unused );
void NewMissile( Ship *ship, Ship *target, Character *firedBy, int missiletype );
void ExtractMissile( Missile *missile );

#endif /* include guard */
