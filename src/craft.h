#ifndef _SWRIP_CRAFT_H_
#define _SWRIP_CRAFT_H_

#include "types.h"
#include "constants.h"

#define CRAFTFLAG_NONE     0
#define CRAFTFLAG_EXTRACT  BV00
#define CRAFTFLAG_OPTIONAL BV01

struct CraftingSession;
typedef struct CraftingSession CraftingSession;

struct CraftRecipe;
typedef struct CraftRecipe CraftRecipe;

struct CraftingMaterial;
typedef struct CraftingMaterial CraftingMaterial;

struct CraftingMaterial
{
  int ItemType;
  int Count;
  long Flags;
};

CraftRecipe *AllocateCraftRecipe( int sn, CraftingMaterial*, int duration, vnum_t protoObject);
void FreeCraftRecipe( CraftRecipe *recipe );
CraftingSession *AllocateCraftingSession( CraftRecipe *recipe, Character *engineer );
void FreeCraftingSession( CraftingSession *session );

#endif /* include guard */
