#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

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

  CREATE( ud, struct UserData, 1 );

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
  argument = one_argument( argument, wearLoc );
  strcpy( itemName, argument );

  if ( itemName[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makecomlink <wearloc> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->WearLocation = get_wearflag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      ch_printf( ch, "&R'%s' is not a wear location.&w\r\n", wearLoc );
      args->AbortSession = true;
      return;
    }
  else
    {
      ud->WearLocation = 1 << ud->WearLocation;
    }

  if ( !CanUseWearLocation( ud->WearLocation ) )
    {
      ch_printf( ch, "&RYou cannot make a comlink for that body part.\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = str_dup( itemName );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *comlink = args->Object;

  SET_BIT( comlink->wear_flags, ITEM_TAKE );
  SET_BIT( comlink->wear_flags, ud->WearLocation );

  comlink->weight = 1;

  STRFREE( comlink->name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " comlink" );
  comlink->name = STRALLOC( buf );

  strcpy( buf, ud->ItemName );
  STRFREE( comlink->short_descr );
  comlink->short_descr = STRALLOC( buf );

  STRFREE( comlink->description );
  strcat( buf, " was left here." );
  comlink->description = STRALLOC( capitalize( buf ) );

  comlink->cost = 50;
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
      DISPOSE( ud->ItemName );
    }

  DISPOSE( ud );
}

static bool CanUseWearLocation( int wearLocation )
{
  return wearLocation == ITEM_HOLD
    || wearLocation == ITEM_WEAR_NECK
    || wearLocation == ITEM_WEAR_WRIST
    || wearLocation == ITEM_WEAR_EARS;
}
