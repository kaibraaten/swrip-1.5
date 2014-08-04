#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

#define MAX_NUMBER_OF_CRYSTALS 3

struct UserData
{
  int GemType;
  int GemCount;
  int Charge;
};

static void InterpretArgumentsHandler( void *userData, void *args );
static void CheckRequirementsHandler( void *userData, void *args );
static void MaterialFoundHandler( void *userData, void *args );
static void SetObjectStatsHandler( void *userData, void *args );
static void FinishedCraftingHandler( void *userData, void *args );
static void AbortHandler( void *userData, void *args );

void do_makelightsaber( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,        CRAFTFLAG_NONE },
      { ITEM_OVEN,           CRAFTFLAG_NONE },
      { ITEM_LENS,           CRAFTFLAG_EXTRACT },
      { ITEM_CRYSTAL,        CRAFTFLAG_EXTRACT },
      { ITEM_MIRROR,         CRAFTFLAG_EXTRACT },
      { ITEM_DURAPLAST,      CRAFTFLAG_EXTRACT },
      { ITEM_BATTERY,        CRAFTFLAG_EXTRACT },
      { ITEM_CIRCUIT,        CRAFTFLAG_EXTRACT },
      { ITEM_SUPERCONDUCTOR, CRAFTFLAG_EXTRACT },
      { ITEM_NONE,           CRAFTFLAG_EXTRACT },
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_lightsaber_crafting, materials,
					     25, OBJ_VNUM_CRAFTING_LIGHTSABER );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  CREATE( data, struct UserData, 1 );

  AddEventHandler( session->OnInterpretArguments, data, InterpretArgumentsHandler );
  AddEventHandler( session->OnCheckRequirements, data, CheckRequirementsHandler );
  AddEventHandler( session->OnMaterialFound, data, MaterialFoundHandler );
  AddEventHandler( session->OnSetObjectStats, data, SetObjectStatsHandler );
  AddEventHandler( session->OnFinishedCrafting, data, FinishedCraftingHandler );
  AddEventHandler( session->OnAbort, data, AbortHandler );

  StartCrafting( session );
}

static void InterpretArgumentsHandler( void *userData, void *args )
{
  InterpretArgumentsEventArgs *eventArgs = (InterpretArgumentsEventArgs*) args;
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( eventArgs->CommandArguments[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makelightsaber <name>\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  AddCraftingArgument( eventArgs->CraftingSession, eventArgs->CommandArguments );
}

static void MaterialFoundHandler( void *userData, void *args )
{
  struct UserData *ud = (struct UserData*) userData;
  MaterialFoundEventArgs *eventArgs = (MaterialFoundEventArgs*) args;

  if( eventArgs->Object->item_type == ITEM_BATTERY )
    {
      ud->Charge = umax( eventArgs->Object->value[0], 10 );
    }

  if( eventArgs->Object->item_type == ITEM_CRYSTAL
      && ud->GemCount < MAX_NUMBER_OF_CRYSTALS )
    {
      ++ud->GemCount;
      eventArgs->KeepFinding = ud->GemCount < MAX_NUMBER_OF_CRYSTALS;

      if( ud->GemType < eventArgs->Object->value[0] )
	{
	  ud->GemType = eventArgs->Object->value[0];
	}
    }
}

static void SetObjectStatsHandler( void *userData, void *args )
{
  struct UserData *ud = (struct UserData*) userData;
  SetObjectStatsEventArgs *eventArgs = (SetObjectStatsEventArgs*) args;
  OBJ_DATA *lightsaber = eventArgs->Object;
  const char *itemName = GetCraftingArgument( eventArgs->CraftingSession, 0 );
  char buf[MAX_STRING_LENGTH];
  Affect *paf = NULL;
  Affect *paf2 = NULL;

  SET_BIT( lightsaber->wear_flags, ITEM_WIELD );
  SET_BIT( lightsaber->wear_flags, ITEM_TAKE );
  SET_BIT( lightsaber->extra_flags, ITEM_ANTI_SOLDIER );
  SET_BIT( lightsaber->extra_flags, ITEM_ANTI_THIEF );
  SET_BIT( lightsaber->extra_flags, ITEM_ANTI_HUNTER );
  SET_BIT( lightsaber->extra_flags, ITEM_ANTI_PILOT );
  SET_BIT( lightsaber->extra_flags, ITEM_ANTI_CITIZEN );

  lightsaber->weight = 5;

  STRFREE( lightsaber->name );
  lightsaber->name = STRALLOC( "lightsaber saber" );

  strcpy( buf, itemName );
  STRFREE( lightsaber->short_descr );
  lightsaber->short_descr = STRALLOC( buf );

  STRFREE( lightsaber->description );
  strcat( buf, " was carelessly misplaced here." );
  lightsaber->description = STRALLOC( buf );

  STRFREE( lightsaber->action_desc );
  strcpy( buf, itemName );
  strcat( buf, " ignites with a hum and a soft glow." );
  lightsaber->action_desc = STRALLOC( buf );

  CREATE( paf, Affect, 1 );
  paf->type               = -1;
  paf->duration           = -1;
  paf->location           = get_affecttype( "hitroll" );
  paf->modifier           = urange( 0, ud->GemCount, lightsaber->level / 30 );
  paf->bitvector          = 0;
  paf->next               = NULL;
  LINK( paf, lightsaber->first_affect, lightsaber->last_affect, next, prev );
  ++top_affect;

  CREATE( paf2, Affect, 1 );
  paf2->type               = -1;
  paf2->duration           = -1;
  paf2->location           = get_affecttype( "parry" );
  paf2->modifier           = ( lightsaber->level / 3 );
  paf2->bitvector          = 0;
  paf2->next               = NULL;
  LINK( paf2, lightsaber->first_affect, lightsaber->last_affect, next, prev );
  ++top_affect;

  lightsaber->value[0] = INIT_WEAPON_CONDITION;                            /* condition  */
  lightsaber->value[1] = (int) (lightsaber->level / 10 + ud->GemType * 2); /* min dmg  */
  lightsaber->value[2] = (int) (lightsaber->level / 5 + ud->GemType * 6);  /* max dmg */
  lightsaber->value[3] = WEAPON_LIGHTSABER;
  lightsaber->value[4] = ud->Charge;
  lightsaber->value[5] = ud->Charge;
  lightsaber->cost = lightsaber->value[2] * 75;
}

static void FinishedCraftingHandler( void *userData, void *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}

static void AbortHandler( void *userData, void *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}

static void CheckRequirementsHandler( void *userData, void *args )
{
  CheckRequirementsEventArgs *eventArgs = (CheckRequirementsEventArgs*) args;
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( !IS_SET( ch->in_room->room_flags, ROOM_SAFE )
       || !IS_SET( ch->in_room->room_flags, ROOM_SILENCE ))
    {
      ch_printf( ch, "&RYou need to be in a quiet, peaceful place to craft a lightsaber.&w\r\n" );
      eventArgs->AbortSession = true;
      return;
    }
}
