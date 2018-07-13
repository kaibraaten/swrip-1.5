#ifndef _SWRIP_MISSILE_HPP_
#define _SWRIP_MISSILE_HPP_

#include <utility/vector3.hpp>

#include "types.h"
#include "constants.h"

extern Missile *FirstMissile;
extern Missile *LastMissile;

struct Missile
{
  Missile *Next;
  Missile *Previous;
  Missile *NextInSpaceobject;
  Missile *PreviousInSpaceobject;
  struct Spaceobject *Spaceobject;
  Ship *Target;
  Ship *FiredFrom;
  char *FiredBy;
  MissileType Type;
  short Age;
  int Speed;
  Vector3 Position;
  Vector3 Heading;
};

bool UpdateMissile( Missile *missile, void *unused );
void NewMissile( Ship *ship, Ship *target, Character *firedBy, MissileType missiletype );
void ExtractMissile( Missile *missile );

#endif /* include guard */
