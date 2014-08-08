/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

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
  struct CraftingSession *CraftingSession;
  const char *CommandArguments;
  bool AbortSession;
};

struct MaterialFoundEventArgs
{
  struct CraftingSession *CraftingSession;
  OBJ_DATA *Object;
  bool KeepFinding;
};

struct SetObjectStatsEventArgs
{
  struct CraftingSession *CraftingSession;
  OBJ_DATA *Object;
};

struct FinishedCraftingEventArgs
{
  struct CraftingSession *CraftingSession;
  OBJ_DATA *Object;
};

struct CheckRequirementsEventArgs
{
  struct CraftingSession *CraftingSession;
  bool AbortSession;
};

struct AbortEventArgs
{
  struct CraftingSession *CraftingSession;
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
