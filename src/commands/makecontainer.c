#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "craft.h"
#include "character.h"
#include "skill.h"

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

  AllocateMemory( ud, struct UserData, 1 );

  AddInterpretArgumentsCraftingHandler( session, ud, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, ud, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, ud, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, ud, AbortHandler );

  StartCrafting( session );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  Object *container = eventArgs->Object;
  char description[MAX_STRING_LENGTH];

  SetBit( container->WearFlags, ITEM_TAKE );
  SetBit( container->WearFlags, ud->WearLocation );

  FreeMemory( container->Name );
  container->Name = CopyString( ud->ItemName );

  FreeMemory( container->ShortDescr );
  container->ShortDescr = CopyString( ud->ItemName );

  FreeMemory( container->Description );
  sprintf( description, "%s was dropped here.", Capitalize( ud->ItemName ) );
  container->Description = CopyString( description );

  container->Value[OVAL_CONTAINER_CAPACITY] = container->Level;
  container->Value[OVAL_CONTAINER_FLAGS] = 0;
  container->Value[OVAL_CONTAINER_KEY] = 0;
  container->Value[OVAL_CONTAINER_CONDITION] = 10;
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
  argument = OneArgument( argument, wearLoc );
  strcpy( itemName, argument );

  if ( IsNullOrEmpty( itemName ) )
    {
      SendToCharacter( "&RUsage: Makecontainer <wearloc> <name>\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  ud->WearLocation = GetWearFlag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      Echo( ch, "&R'%s' is not a wear location.&w\r\n", wearLoc );
      eventArgs->AbortSession = true;
      return;
    }
  else
    {
      ud->WearLocation = 1 << ud->WearLocation;
    }

  if ( !CanUseWearLocation( ud->WearLocation ) )
    {
      Echo( ch, "&RYou cannot make a container for that body part.\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( itemName );
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
  return wearLocation == ITEM_WEAR_BODY
    || wearLocation == ITEM_WEAR_ABOUT
    || wearLocation == ITEM_HOLD
    || wearLocation == ITEM_TAKE;
}
