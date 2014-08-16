#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "craft.h"
#include "character.h"

struct UserData
{
  int WearLocation;
  char *ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );
static bool CanUseWearLocation( int wearLocation );

void do_makecontainer( Character *ch, char *argument )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_FABRIC, CRAFTFLAG_EXTRACT },
      { ITEM_THREAD, CRAFTFLAG_NONE },
      { ITEM_NONE,   CRAFTFLAG_NONE }
    };

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecontainer, materials,
                                             10, OBJ_VNUM_CRAFTING_CONTAINER,
					     CRAFTFLAG_NEED_WORKSHOP );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
  struct UserData *ud = NULL;

  CREATE( ud, struct UserData, 1 );

  AddInterpretArgumentsCraftingHandler( session, ud, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, ud, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, ud, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, ud, AbortHandler );

  StartCrafting( session );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  OBJ_DATA *container = eventArgs->Object;
  char description[MAX_STRING_LENGTH];

  SET_BIT( container->wear_flags, ITEM_TAKE );
  SET_BIT( container->wear_flags, ud->WearLocation );

  STRFREE( container->name );
  container->name = STRALLOC( ud->ItemName );

  STRFREE( container->short_descr );
  container->short_descr = STRALLOC( ud->ItemName );

  STRFREE( container->description );
  sprintf( description, "%s was dropped here.", capitalize( ud->ItemName ) );
  container->description = STRALLOC( description );

  container->value[0] = container->level;
  container->value[1] = 0;
  container->value[2] = 0;
  container->value[3] = 10;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  CraftingSession *session = eventArgs->CraftingSession;
  char originalArgs[MAX_INPUT_LENGTH];
  char *argument = originalArgs;
  char wearLoc[MAX_STRING_LENGTH];
  char itemName[MAX_STRING_LENGTH];
  Character *ch = GetEngineer( session );

  strcpy( argument, eventArgs->CommandArguments );
  argument = one_argument( argument, wearLoc );
  strcpy( itemName, argument );

  if ( itemName[0] == '\0' )
    {
      send_to_char( "&RUsage: Makecontainer <wearloc> <name>\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  ud->WearLocation = get_wearflag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      ch_printf( ch, "&R'%s' is not a wear location.&w\r\n", wearLoc );
      eventArgs->AbortSession = true;
      return;
    }
  else
    {
      ud->WearLocation = 1 << ud->WearLocation;
    }

  if ( !CanUseWearLocation( ud->WearLocation ) )
    {
      ch_printf( ch, "&RYou cannot make a container for that body part.\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = str_dup( itemName );
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
  return wearLocation == ITEM_WEAR_BODY
    || wearLocation == ITEM_WEAR_ABOUT
    || wearLocation == ITEM_HOLD
    || wearLocation == ITEM_TAKE;
}
