#ifndef _SWRIP_CRAFT_H_
#define _SWRIP_CRAFT_H_

#include "types.h"
#include "constants.h"

#define CRAFTFLAG_NONE     0
#define CRAFTFLAG_EXTRACT  BV00
#define CRAFTFLAG_OPTIONAL BV01

/*
 * Moved to types.h for now.
struct CraftingSession;
typedef struct CraftingSession CraftingSession;
*/

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
void FreeCraftRecipe( CraftRecipe* );
CraftingSession *AllocateCraftingSession( CraftRecipe*, Character *engineer, char *commandArgument,
					  bool (*InterpretArguments)( CraftingSession*, char* ),
					  void (*SetObjectStats)( CraftingSession*, OBJ_DATA* ) );
void FreeCraftingSession( CraftingSession* );
Character *GetEngineer( CraftingSession* );
void AddCraftingArgument( CraftingSession*, char *argument );
const char *GetCraftingArgument( const CraftingSession*, size_t argumentNumber );

void StartCrafting( CraftingSession* );

#endif /* include guard */
