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

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );

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
      { ITEM_NONE,           CRAFTFLAG_NONE },
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_lightsaber_crafting, materials,
					     25, OBJ_VNUM_CRAFTING_LIGHTSABER );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  CREATE( data, struct UserData, 1 );

  AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
  AddCheckRequirementsCraftingHandler( session, data, CheckRequirementsHandler );
  AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
  AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, data, AbortHandler );

  StartCrafting( session );
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( eventArgs->CommandArguments[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makelightsaber <name>\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  AddCraftingArgument( eventArgs->CraftingSession, eventArgs->CommandArguments );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;

  if( eventArgs->Object->item_type == ITEM_BATTERY )
    {
      ud->Charge = umax( eventArgs->Object->value[OVAL_BATTERY_CHARGE], 10 );
    }

  if( eventArgs->Object->item_type == ITEM_CRYSTAL
      && ud->GemCount < MAX_NUMBER_OF_CRYSTALS )
    {
      ++ud->GemCount;
      eventArgs->KeepFinding = ud->GemCount < MAX_NUMBER_OF_CRYSTALS;

      if( ud->GemType < eventArgs->Object->value[OVAL_CRYSTAL_TYPE] )
	{
	  ud->GemType = eventArgs->Object->value[OVAL_CRYSTAL_TYPE];
	}
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
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
  sprintf( buf, "%s was carelessly misplaced here.", capitalize( itemName ) );
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

  lightsaber->value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
  lightsaber->value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (lightsaber->level / 10 + ud->GemType * 2);
  lightsaber->value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (lightsaber->level / 5 + ud->GemType * 6);
  lightsaber->value[OVAL_WEAPON_TYPE] = WEAPON_LIGHTSABER;
  lightsaber->value[OVAL_WEAPON_CHARGE] = ud->Charge;
  lightsaber->value[OVAL_WEAPON_MAX_CHARGE] = ud->Charge;
  lightsaber->cost = lightsaber->value[OVAL_WEAPON_SIZE_DAM_DIE] * 75;
}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *eventArgs )
{
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( !IS_SET( ch->in_room->room_flags, ROOM_SAFE )
       || !IS_SET( ch->in_room->room_flags, ROOM_SILENCE ))
    {
      ch_printf( ch, "&RYou need to be in a quiet, peaceful place to craft a lightsaber.&w\r\n" );
      eventArgs->AbortSession = true;
      return;
    }
}
