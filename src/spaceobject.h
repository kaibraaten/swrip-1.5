#ifndef _SWRIP_SPACEOBJECT_H_
#define _SWRIP_SPACEOBJECT_H_

#include "types.h"

extern Spaceobject *FirstSpaceobject;
extern Spaceobject *LastSpaceobject;

#define MAX_LANDINGSITE 3

typedef struct LandingSite LandingSite;

struct LandingSite
{
  char  *LocationName;
  vnum_t Dock;
  bool   IsSecret;
};

struct Spaceobject
{
  Spaceobject  *Next;
  Spaceobject  *Previous;
  struct Planet *Planet;
  char        *Name;
  SpaceobjectType Type;
  Vector3      Position;
  Vector3      Heading;
  int          Speed;
  int          Gravity;
  bool         IsSimulator;

  LandingSite LandingSites[MAX_LANDINGSITE];
};

void LoadSpaceobjects( void );
void SaveSpaceobject( const Spaceobject *spaceobject );
bool NewSaveSpaceobject( const Spaceobject *spaceobject, int dummy );
const char *GetSpaceobjectFilename( const Spaceobject *spaceobject );
Spaceobject *GetSpaceobject( const char *name );
Spaceobject *GetSpaceobjectFromDockVnum( vnum_t vnum );
void SpaceobjectUpdate( void );
LandingSite *GetLandingSiteFromVnum( const Spaceobject *spaceobj, vnum_t vnum );
LandingSite *GetLandingSiteFromLocationName( const Spaceobject *spaceobj, const char *name );

#endif
