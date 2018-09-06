#include <cstring>
#include <cstdlib>

#include "mud.hpp"
#include "craft.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  int WearLocation = 0;
  std::string ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( UserData *ud );
static bool CanUseWearLocation( int wearLocation );

void do_makecontainer( Character *ch, std::string argument )
{
  static const CraftingMaterial materials[] =
    {
      { ITEM_FABRIC, CRAFTFLAG_EXTRACT },
      { ITEM_THREAD, CRAFTFLAG_NONE },
      { ITEM_NONE,   CRAFTFLAG_NONE }
    };

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecontainer, materials,
                                             10, OBJ_VNUM_CRAFTING_CONTAINER,
					     CRAFTFLAG_NEED_WORKSHOP );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
  UserData *ud = new UserData();

  AddInterpretArgumentsCraftingHandler( session, ud, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, ud, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, ud, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, ud, AbortHandler );

  StartCrafting( session );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  UserData *ud = (UserData*) userData;
  Object *container = eventArgs->Object;

  SetBit( container->WearFlags, ITEM_TAKE );
  SetBit( container->WearFlags, ud->WearLocation );

  container->Name = ud->ItemName;
  container->ShortDescr = ud->ItemName;
  container->Description = Capitalize( ud->ItemName ) + " was dropped here.";

  container->Value[OVAL_CONTAINER_CAPACITY] = container->Level;
  container->Value[OVAL_CONTAINER_FLAGS] = 0;
  container->Value[OVAL_CONTAINER_KEY] = 0;
  container->Value[OVAL_CONTAINER_CONDITION] = 10;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
  UserData *ud = (UserData*) userData;
  CraftingSession *session = eventArgs->CraftingSession;
  std::string argument = eventArgs->CommandArguments;
  std::string wearLoc;
  std::string itemName;
  Character *ch = GetEngineer( session );

  argument = OneArgument( argument, wearLoc );
  itemName = argument;

  if ( itemName.empty() )
    {
      ch->Echo("&RUsage: Makecontainer <body|about|take|hold> <name>\r\n&w");
      eventArgs->AbortSession = true;
      return;
    }

  ud->WearLocation = GetWearFlag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str() );
      eventArgs->AbortSession = true;
      return;
    }
  else
    {
      ud->WearLocation = 1 << ud->WearLocation;
    }

  if ( !CanUseWearLocation( ud->WearLocation ) )
    {
      ch->Echo("&RYou cannot make a container for that body part.\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = itemName;
}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
  UserData *ud = (UserData*) userData;
  FreeUserData( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  UserData *ud = (UserData*) userData;
  FreeUserData( ud );
}

static void FreeUserData( UserData *ud )
{
  delete ud;
}

static bool CanUseWearLocation( int wearLocation )
{
  return wearLocation == ITEM_WEAR_BODY
    || wearLocation == ITEM_WEAR_ABOUT
    || wearLocation == ITEM_HOLD
    || wearLocation == ITEM_TAKE;
}
