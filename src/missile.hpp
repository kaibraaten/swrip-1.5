#ifndef _SWRIP_MISSILE_HPP_
#define _SWRIP_MISSILE_HPP_

#include <utility/vector3.hpp>

#include "types.hpp"
#include "constants.hpp"

extern Missile *FirstMissile;
extern Missile *LastMissile;

class Missile
{
public:
  Missile *Next = nullptr;
  Missile *Previous = nullptr;
  struct Spaceobject *Spaceobject = nullptr;
  Ship *Target = nullptr;
  Ship *FiredFrom = nullptr;
  std::string FiredBy;
  MissileType Type = 0;
  short Age = 0;
  int Speed = 0;
  Vector3 Position;
  Vector3 Heading;
};

bool UpdateMissile( Missile *missile, void *unused );
void NewMissile( Ship *ship, Ship *target, Character *firedBy, MissileType missiletype );
void ExtractMissile( Missile *missile );

#endif /* include guard */
