#ifndef _SWRIP_SPACEOBJECT_HPP_
#define _SWRIP_SPACEOBJECT_HPP_

#include <memory>
#include <array>
#include <string>
#include "constants.hpp"

constexpr size_t MAX_LANDINGSITE = 3;

class LandingSite
{
public:
  std::string LocationName;
  vnum_t Dock = INVALID_VNUM;
  bool   IsSecret = false;
};

class Spaceobject
{
public:
  std::shared_ptr<class Planet> Planet;
  std::string Name;
  SpaceobjectType Type = 0;
  Vector3      Position;
  Vector3      Heading;
  int          Speed = 0;
  int          Gravity = 0;
  bool         IsSimulator = false;

  std::array<LandingSite, MAX_LANDINGSITE> LandingSites;
};

Spaceobject *GetSpaceobject( const std::string &name );
Spaceobject *GetSpaceobjectFromDockVnum( vnum_t vnum );
void SpaceobjectUpdate( void );
const LandingSite *GetLandingSiteFromVnum( const Spaceobject *spaceobj, vnum_t vnum );
const LandingSite *GetLandingSiteFromLocationName(const Spaceobject *spaceobj,
                                                  const std::string &name);

#endif
