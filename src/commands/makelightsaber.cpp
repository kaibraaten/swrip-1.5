#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "object.hpp"

#define MAX_NUMBER_OF_CRYSTALS 3

struct UserData
{
  char *ItemName = nullptr;
  int GemType = 0;
  int GemCount = 0;
  int Charge = 0;
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
  UserData *data = new UserData();

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

  if ( IsNullOrEmpty( eventArgs->CommandArguments ) )
    {
      ch->Echo("&RUsage: Makelightsaber <name>\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( eventArgs->CommandArguments );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;

  if( eventArgs->Object->ItemType == ITEM_BATTERY )
    {
      ud->Charge = umax( eventArgs->Object->Value[OVAL_BATTERY_CHARGE], 10 );
    }

  if( eventArgs->Object->ItemType == ITEM_CRYSTAL
      && ud->GemCount < MAX_NUMBER_OF_CRYSTALS )
    {
      ++ud->GemCount;
      eventArgs->KeepFinding = ud->GemCount < MAX_NUMBER_OF_CRYSTALS;

      if( ud->GemType < eventArgs->Object->Value[OVAL_CRYSTAL_TYPE] )
	{
	  ud->GemType = eventArgs->Object->Value[OVAL_CRYSTAL_TYPE];
	}
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  Object *lightsaber = eventArgs->Object;
  char buf[MAX_STRING_LENGTH];

  SetBit( lightsaber->WearFlags, ITEM_WIELD );
  SetBit( lightsaber->WearFlags, ITEM_TAKE );

  lightsaber->Weight = 5;

  FreeMemory( lightsaber->Name );
  lightsaber->Name = CopyString( "lightsaber saber" );

  strcpy( buf, ud->ItemName );
  FreeMemory( lightsaber->ShortDescr );
  lightsaber->ShortDescr = CopyString( buf );

  FreeMemory( lightsaber->Description );
  sprintf( buf, "%s was carelessly misplaced here.", Capitalize( ud->ItemName ) );
  lightsaber->Description = CopyString( buf );

  FreeMemory( lightsaber->ActionDescription );
  strcpy( buf, ud->ItemName );
  strcat( buf, " ignites with a hum and a soft glow." );
  lightsaber->ActionDescription = CopyString( buf );

  Affect *hitroll = new Affect();
  hitroll->Type               = -1;
  hitroll->Duration           = -1;
  hitroll->Location           = GetAffectType( "hitroll" );
  hitroll->Modifier           = urange( 0, ud->GemCount, lightsaber->Level / 30 );
  lightsaber->Add(hitroll);
  ++top_affect;

  Affect *parry = new Affect();
  parry->Type               = -1;
  parry->Duration           = -1;
  parry->Location           = GetAffectType( "parry" );
  parry->Modifier           = lightsaber->Level / 3;
  lightsaber->Add(parry);
  ++top_affect;

  lightsaber->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
  lightsaber->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (lightsaber->Level / 10 + ud->GemType * 2);
  lightsaber->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (lightsaber->Level / 5 + ud->GemType * 6);
  lightsaber->Value[OVAL_WEAPON_TYPE] = WEAPON_LIGHTSABER;
  lightsaber->Value[OVAL_WEAPON_CHARGE] = ud->Charge;
  lightsaber->Value[OVAL_WEAPON_MAX_CHARGE] = ud->Charge;
  lightsaber->Cost = lightsaber->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 75;
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

  delete ud;
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *eventArgs )
{
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( !IsBitSet( ch->InRoom->Flags, ROOM_SAFE )
       || !IsBitSet( ch->InRoom->Flags, ROOM_SILENCE ))
    {
      ch->Echo("&RYou need to be in a quiet, peaceful place to craft a lightsaber.&w\r\n" );
      eventArgs->AbortSession = true;
      return;
    }
}

