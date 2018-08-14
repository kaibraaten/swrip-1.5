#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

struct UserData
{
  int Strength;
  int Weight;
  int Level;
  char *ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );

void do_makelandmine( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,         CRAFTFLAG_NONE },
      { ITEM_BATTERY,         CRAFTFLAG_EXTRACT },
      { ITEM_CIRCUIT,         CRAFTFLAG_EXTRACT },
      { ITEM_DRINK_CON,       CRAFTFLAG_EXTRACT },
      { ITEM_CHEMICAL,        CRAFTFLAG_EXTRACT },
      { ITEM_NONE,            CRAFTFLAG_NONE },
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makelandmine, materials,
                                             25, OBJ_VNUM_CRAFTING_LANDMINE,
					     CRAFTFLAG_NEED_WORKSHOP );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AllocateMemory( data, struct UserData, 1 );
  data->Level = IsNpc(ch) ? ch->TopLevel : (int) (ch->PCData->Learned[gsn_makelandmine]);

  AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
  AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
  AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, data, AbortHandler );

  StartCrafting( session );
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );
  struct UserData *ud = (struct UserData*) userData;

  if ( IsNullOrEmpty( args->CommandArguments ) )
    {
      ch->Echo("&RUsage: Makelandmine <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( args->CommandArguments );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->ItemType == ITEM_DRINK_CON
      && args->Object->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] > 0 )
    {
      /* FAIL! */
    }

  if( args->Object->ItemType == ITEM_CHEMICAL )
    {
      ud->Strength = urange( 10, args->Object->Value[OVAL_CHEMICAL_STRENGTH], ud->Level * 5 );
      ud->Weight = args->Object->Weight;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *landmine = args->Object;

  SetBit( landmine->WearFlags, ITEM_HOLD );
  SetBit( landmine->WearFlags, ITEM_TAKE );
  landmine->Weight = ud->Weight;

  FreeMemory( landmine->Name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " landmine");
  landmine->Name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( landmine->ShortDescr );
  landmine->ShortDescr = CopyString( buf );

  FreeMemory( landmine->Description );
  strcat( buf, " was carelessly misplaced here." );
  landmine->Description = CopyString( Capitalize( buf ) );

  landmine->Value[OVAL_EXPLOSIVE_MIN_DMG] = ud->Strength / 2;
  landmine->Value[OVAL_EXPLOSIVE_MAX_DMG] = ud->Strength;
  landmine->Cost = landmine->Value[OVAL_EXPLOSIVE_MAX_DMG] * 5;
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


