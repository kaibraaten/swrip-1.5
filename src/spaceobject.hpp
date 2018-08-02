#ifndef _SWRIP_SPACEOBJECT_HPP_
#define _SWRIP_SPACEOBJECT_HPP_

#include <array>
#include <utility/repository.hpp>
#include "types.hpp"

constexpr size_t MAX_LANDINGSITE = 3;

struct LandingSite
{
  char  *LocationName;
  vnum_t Dock;
  bool   IsSecret;
};

struct Spaceobject
{
  struct Planet *Planet;
  char        *Name;
  SpaceobjectType Type;
  Vector3      Position;
  Vector3      Heading;
  int          Speed;
  int          Gravity;
  bool         IsSimulator;

  std::array<LandingSite, MAX_LANDINGSITE> LandingSites;
};

const char *GetSpaceobjectFilename( const Spaceobject *spaceobject );
Spaceobject *GetSpaceobject( const char *name );
Spaceobject *GetSpaceobjectFromDockVnum( vnum_t vnum );
void SpaceobjectUpdate( void );
LandingSite *GetLandingSiteFromVnum( const Spaceobject *spaceobj, vnum_t vnum );
LandingSite *GetLandingSiteFromLocationName( const Spaceobject *spaceobj, const char *name );

class SpaceobjectRepository : public Ceris::Repository<Spaceobject*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Spaceobject *spaceobject) const = 0;
};

extern SpaceobjectRepository *Spaceobjects;
SpaceobjectRepository *NewSpaceobjectRepository();

#endif
