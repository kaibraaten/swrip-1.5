#ifndef _SWRIP_CRAFT_H_
#define _SWRIP_CRAFT_H_

#include <event.h>
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

struct SetObjectStatsEventArgs;
typedef struct SetObjectStatsEventArgs SetObjectStatsEventArgs;

struct InterpretArgumentsEventArgs;
typedef struct InterpretArgumentsEventArgs InterpretArgumentsEventArgs;

struct MaterialFoundEventArgs;
typedef struct MaterialFoundEventArgs MaterialFoundEventArgs;

struct FinishedCraftingEventArgs;
typedef struct FinishedCraftingEventArgs FinishedCraftingEventArgs;

struct CheckRequirementsEventArgs;
typedef struct CheckRequirementsEventArgs CheckRequirementsEventArgs;

struct AbortEventArgs;
typedef struct AbortEventArgs AbortEventArgs;

struct CraftingSessionImpl;

struct InterpretArgumentsEventArgs
{
  CraftingSession *CraftingSession;
  const char *CommandArguments;
  bool AbortSession;
};

struct MaterialFoundEventArgs
{
  CraftingSession *CraftingSession;
  OBJ_DATA *Object;
  bool Extract;
};

struct SetObjectStatsEventArgs
{
  CraftingSession *CraftingSession;
  OBJ_DATA *Object;
};

struct FinishedCraftingEventArgs
{
  CraftingSession *CraftingSession;
  OBJ_DATA *Object;
};

struct CheckRequirementsEventArgs
{
  CraftingSession *CraftingSession;
  bool AbortSession;
};

struct AbortEventArgs
{
  CraftingSession *CraftingSession;
};

struct CraftingSession
{
  event_t *OnInterpretArguments;
  event_t *OnCheckRequirements;
  event_t *OnMaterialFound;
  event_t *OnSetObjectStats;
  event_t *OnFinishedCrafting;
  event_t *OnAbort;

  struct CraftingSessionImpl *_pImpl;
};

struct CraftingMaterial
{
  int ItemType;
  long Flags;
};

CraftRecipe *AllocateCraftRecipe( int sn, const CraftingMaterial*, int duration,
				  vnum_t protoObject);
void FreeCraftRecipe( CraftRecipe* );
CraftingSession *AllocateCraftingSession( CraftRecipe*, Character *engineer,
					  char *commandArgument );
void FreeCraftingSession( CraftingSession* );
Character *GetEngineer( const CraftingSession* );
void AddCraftingArgument( CraftingSession*, const char *argument );
const char *GetCraftingArgument( const CraftingSession*, size_t argumentNumber );

void StartCrafting( CraftingSession* );

#endif /* include guard */
