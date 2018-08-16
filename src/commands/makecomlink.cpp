#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  char *ItemName;
  int WearLocation;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );
static bool CanUseWearLocation( int wearLocation );
static CraftRecipe *MakeCraftRecipe( void );

void do_makecomlink( Character *ch, char *argument )
{
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
  struct UserData *ud = NULL;

  AllocateMemory( ud, struct UserData, 1 );

  AddInterpretArgumentsCraftingHandler( session, ud, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, ud, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, ud, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, ud, AbortHandler );

  StartCrafting( session );
}

static CraftRecipe *MakeCraftRecipe( void )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,  CRAFTFLAG_NONE },
      { ITEM_OVEN,     CRAFTFLAG_NONE },
      { ITEM_CIRCUIT,  CRAFTFLAG_EXTRACT },
      { ITEM_CRYSTAL,  CRAFTFLAG_EXTRACT },
      { ITEM_NONE,     CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecomlink, materials,
					     10, OBJ_VNUM_CRAFTING_COMLINK,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );
  char originalArgs[MAX_INPUT_LENGTH];
  char *argument = originalArgs;
  char wearLoc[MAX_STRING_LENGTH];
  char itemName[MAX_STRING_LENGTH];

  strcpy( argument, args->CommandArguments );
  argument = OneArgument( argument, wearLoc );
  strcpy( itemName, argument );

  if ( IsNullOrEmpty( itemName ) )
    {
      ch->Echo("&RUsage: Makecomlink <wearloc> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->WearLocation = GetWearFlag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc );
      args->AbortSession = true;
      return;
    }
  else
    {
      ud->WearLocation = 1 << ud->WearLocation;
    }

  if ( !CanUseWearLocation( ud->WearLocation ) )
    {
      ch->Echo("&RYou cannot make a comlink for that body part.\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( itemName );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *comlink = args->Object;

  SetBit( comlink->WearFlags, ITEM_TAKE );
  SetBit( comlink->WearFlags, ud->WearLocation );

  comlink->Weight = 1;

  FreeMemory( comlink->Name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " comlink" );
  comlink->Name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( comlink->ShortDescr );
  comlink->ShortDescr = CopyString( buf );

  FreeMemory( comlink->Description );
  strcat( buf, " was left here." );
  comlink->Description = CopyString( Capitalize( buf ) );

  comlink->Cost = 50;
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

static bool CanUseWearLocation( int wearLocation )
{
  return wearLocation == ITEM_HOLD
    || wearLocation == ITEM_WEAR_NECK
    || wearLocation == ITEM_WEAR_WRIST
    || wearLocation == ITEM_WEAR_EARS;
}

