#include <string.h>
#include "mud.h"
#include "character.hpp"
#include "craft.h"
#include "skill.h"

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

void do_makegrenade( Character *ch, char *argument )
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
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makegrenade, materials,
                                             25, OBJ_VNUM_CRAFTING_GRENADE,
					     CRAFTFLAG_NEED_WORKSHOP );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AllocateMemory( data, struct UserData, 1 );
  data->Level = IsNpc(ch) ? ch->TopLevel : (int) (ch->PCData->Learned[gsn_makegrenade]);

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
      Echo( ch, "&RUsage: Makegrenade <name>\r\n&w" );
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
  Object *grenade = args->Object;

  SetBit( grenade->WearFlags, ITEM_HOLD );
  SetBit( grenade->WearFlags, ITEM_TAKE );
  grenade->Weight = ud->Weight;

  FreeMemory( grenade->Name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " grenade");
  grenade->Name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( grenade->ShortDescr );
  grenade->ShortDescr = CopyString( buf );

  FreeMemory( grenade->Description );
  strcat( buf, " was carelessly misplaced here." );
  grenade->Description = CopyString( Capitalize( buf ) );

  grenade->Value[OVAL_EXPLOSIVE_MIN_DMG] = ud->Strength / 2;
  grenade->Value[OVAL_EXPLOSIVE_MAX_DMG] = ud->Strength;
  grenade->Cost = grenade->Value[OVAL_EXPLOSIVE_MAX_DMG] * 5;
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
