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

#define CRAFTFLAG_NONE           0
#define CRAFTFLAG_EXTRACT        BV00
#define CRAFTFLAG_OPTIONAL       BV01
#define CRAFTFLAG_NEED_WORKSHOP  BV02
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

struct AbortCraftingEventArgs;
typedef struct AbortCraftingEventArgs AbortCraftingEventArgs;

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

struct AbortCraftingEventArgs
{
  struct CraftingSession *CraftingSession;
};

struct CraftingMaterial
{
  int ItemType;
  long Flags;
};

CraftRecipe *AllocateCraftRecipe( int sn, const CraftingMaterial*, int duration,
				  vnum_t protoObject, long flags );
void FreeCraftRecipe( CraftRecipe* );
CraftingSession *AllocateCraftingSession( CraftRecipe*, Character *engineer,
					  char *commandArgument );
void FreeCraftingSession( CraftingSession* );
Character *GetEngineer( const CraftingSession* );
void AddCraftingArgument( CraftingSession*, const char *argument );
const char *GetCraftingArgument( const CraftingSession*, size_t argumentNumber );

void AddInterpretArgumentsCraftingHandler( CraftingSession *session, void *userData,
					   void (*handler)(void*, InterpretArgumentsEventArgs* ));
void AddCheckRequirementsCraftingHandler( CraftingSession *session, void *userData,
					  void (*handler)(void*, CheckRequirementsEventArgs* ));
void AddMaterialFoundCraftingHandler( CraftingSession *session, void *userData,
				      void (*handler)(void*, MaterialFoundEventArgs* ));
void AddSetObjectStatsCraftingHandler( CraftingSession *session, void *userData,
				       void (*handler)(void*, SetObjectStatsEventArgs* ));
void AddFinishedCraftingHandler( CraftingSession *session, void *userData,
				 void (*handler)(void*, FinishedCraftingEventArgs* ));
void AddAbortCraftingHandler( CraftingSession *session, void *userData,
			      void (*handler)(void*, AbortCraftingEventArgs* ));

void StartCrafting( CraftingSession* );

#endif /* include guard */
