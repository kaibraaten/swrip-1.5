#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"
#include "skill.h"

#define MAX_NUMBER_OF_CRYSTALS 3

struct UserData
{
  char *ItemName;
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
static void FreeUserData( struct UserData *ud );

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
					     25, OBJ_VNUM_CRAFTING_LIGHTSABER,
					     CRAFTFLAG_NONE );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AllocateMemory( data, struct UserData, 1 );

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
  struct UserData *ud = (struct UserData*) userData;

  if ( eventArgs->CommandArguments[0] == '\0' )
    {
      Echo( ch, "&RUsage: Makelightsaber <name>\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( eventArgs->CommandArguments );
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
  Object *lightsaber = eventArgs->Object;
  char buf[MAX_STRING_LENGTH];
  Affect *hitroll = NULL;
  Affect *parry = NULL;

  SetBit( lightsaber->wear_flags, ITEM_WIELD );
  SetBit( lightsaber->wear_flags, ITEM_TAKE );
  SetBit( lightsaber->extra_flags, ITEM_ANTI_SOLDIER );
  SetBit( lightsaber->extra_flags, ITEM_ANTI_THIEF );
  SetBit( lightsaber->extra_flags, ITEM_ANTI_HUNTER );
  SetBit( lightsaber->extra_flags, ITEM_ANTI_PILOT );
  SetBit( lightsaber->extra_flags, ITEM_ANTI_CITIZEN );

  lightsaber->weight = 5;

  FreeMemory( lightsaber->name );
  lightsaber->name = CopyString( "lightsaber saber" );

  strcpy( buf, ud->ItemName );
  FreeMemory( lightsaber->short_descr );
  lightsaber->short_descr = CopyString( buf );

  FreeMemory( lightsaber->description );
  sprintf( buf, "%s was carelessly misplaced here.", Capitalize( ud->ItemName ) );
  lightsaber->description = CopyString( buf );

  FreeMemory( lightsaber->action_desc );
  strcpy( buf, ud->ItemName );
  strcat( buf, " ignites with a hum and a soft glow." );
  lightsaber->action_desc = CopyString( buf );

  AllocateMemory( hitroll, Affect, 1 );
  hitroll->type               = -1;
  hitroll->duration           = -1;
  hitroll->location           = GetAffectType( "hitroll" );
  hitroll->modifier           = urange( 0, ud->GemCount, lightsaber->level / 30 );
  hitroll->bitvector          = 0;
  hitroll->next               = NULL;
  LINK( hitroll, lightsaber->first_affect, lightsaber->last_affect, next, prev );
  ++top_affect;

  AllocateMemory( parry, Affect, 1 );
  parry->type               = -1;
  parry->duration           = -1;
  parry->location           = GetAffectType( "parry" );
  parry->modifier           = lightsaber->level / 3;
  parry->bitvector          = 0;
  parry->next               = NULL;
  LINK( parry, lightsaber->first_affect, lightsaber->last_affect, next, prev );
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
  FreeUserData( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  FreeUserData( ud );
}

static void FreeUserData( struct UserData *ud )
{
  if( ud->ItemName )
    {
      FreeMemory( ud->ItemName );
    }

  FreeMemory( ud );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *eventArgs )
{
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( !IsBitSet( ch->in_room->room_flags, ROOM_SAFE )
       || !IsBitSet( ch->in_room->room_flags, ROOM_SILENCE ))
    {
      Echo( ch, "&RYou need to be in a quiet, peaceful place to craft a lightsaber.&w\r\n" );
      eventArgs->AbortSession = true;
      return;
    }
}
