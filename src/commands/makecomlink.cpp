#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  std::string ItemName;
  int WearLocation = 0;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( UserData *ud );
static bool CanUseWearLocation( int wearLocation );
static CraftRecipe *MakeCraftRecipe( void );

void do_makecomlink( Character *ch, std::string argument )
{
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
  UserData *ud = new UserData();

  AddInterpretArgumentsCraftingHandler( session, ud, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, ud, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, ud, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, ud, AbortHandler );

  StartCrafting( session );
}

static CraftRecipe *MakeCraftRecipe( void )
{
  static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,  {} },
     { ITEM_OVEN,     {} },
     { ITEM_CIRCUIT,  { Flag::Crafting::Extract } },
     { ITEM_CRYSTAL,  { Flag::Crafting::Extract } },
     { ITEM_NONE,     {} }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecomlink, materials,
					     10, GetProtoObject( OBJ_VNUM_CRAFTING_COMLINK ),
					     { Flag::Crafting::NeedsWorkshop } );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  UserData *ud = (UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );
  std::string argument = args->CommandArguments;
  std::string wearLoc;
  std::string itemName;

  argument = OneArgument( argument, wearLoc );
  itemName = argument;

  if ( itemName.empty() )
    {
      ch->Echo("&RUsage: Makecomlink <wearloc> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->WearLocation = GetWearFlag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str() );
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

  ud->ItemName = itemName;
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  UserData *ud = (UserData*) userData;
  char buf[MAX_STRING_LENGTH] = {'\0'};
  Object *comlink = args->Object;

  SetBit( comlink->WearFlags, ITEM_TAKE );
  SetBit( comlink->WearFlags, ud->WearLocation );

  comlink->Weight = 1;

  strcpy( buf, ud->ItemName.c_str() );
  strcat( buf, " comlink" );
  comlink->Name = buf;

  strcpy( buf, ud->ItemName.c_str() );
  comlink->ShortDescr = buf;

  strcat( buf, " was left here." );
  comlink->Description = Capitalize( buf );

  comlink->Cost = 50;
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

static void FreeUserData(UserData *ud )
{
  delete ud;
}

static bool CanUseWearLocation( int wearLocation )
{
  return wearLocation == ITEM_HOLD
    || wearLocation == ITEM_WEAR_NECK
    || wearLocation == ITEM_WEAR_WRIST
    || wearLocation == ITEM_WEAR_EARS;
}
