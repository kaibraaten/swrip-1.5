#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  int ArmorValue = 0;
  int WearLocation = 0;
  char *ItemName = nullptr;
};

static CraftRecipe *CreateMakeArmorRecipe( void );
static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );
static bool CanUseWearLocation( int wearLocation );

void do_makearmor( Character *ch, char *argument )
{
  CraftRecipe *recipe = CreateMakeArmorRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
  UserData *data = new UserData();

  AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
  AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
  AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, data, AbortHandler );

  StartCrafting( session );
}

static CraftRecipe *CreateMakeArmorRecipe( void )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_THREAD, CRAFTFLAG_NONE },
      { ITEM_FABRIC, CRAFTFLAG_EXTRACT },
      { ITEM_NONE, CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makearmor, materials,
					     15, OBJ_VNUM_CRAFTING_ARMOR,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  CraftingSession *session = eventArgs->CraftingSession;
  char originalArgs[MAX_INPUT_LENGTH];
  char *argument = originalArgs;
  char wearLoc[MAX_STRING_LENGTH];
  char name[MAX_STRING_LENGTH];
  Character *ch = GetEngineer( session );

  strcpy( argument, eventArgs->CommandArguments );
  argument = OneArgument( argument, wearLoc );
  strcpy( name, argument );

  if( IsNullOrEmpty(name) )
    {
      ch->Echo("&RUsage: Makearmor <wearloc> <name>\r\n&w");
      eventArgs->AbortSession = true;
      return;
    }

  ud->WearLocation = GetWearFlag( wearLoc );

  if( ud->WearLocation == -1 )
    {
      ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc );
      eventArgs->AbortSession = true;
      return;
    }
  else
    {
      ud->WearLocation = 1 << ud->WearLocation;
    }

  if ( !CanUseWearLocation( ud->WearLocation ) )
    {
      ch->Echo("&RYou cannot make clothing for that body part.\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( name );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *eventArgs )
{
  if( eventArgs->Object->ItemType == ITEM_FABRIC )
    {
      struct UserData *ud = (struct UserData*) userData;
      ud->ArmorValue = eventArgs->Object->Value[OVAL_FABRIC_STRENGTH];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  Object *armor = eventArgs->Object;
  char description[MAX_STRING_LENGTH];

  armor->ItemType = ITEM_ARMOR;
  SetBit( armor->WearFlags, ITEM_TAKE );
  SetBit( armor->WearFlags, ud->WearLocation );

  FreeMemory( armor->Name );
  armor->Name = CopyString( ud->ItemName );

  FreeMemory( armor->ShortDescr );
  armor->ShortDescr = CopyString( ud->ItemName );

  FreeMemory( armor->Description );
  sprintf( description, "%s was dropped here.", Capitalize( ud->ItemName ) );
  armor->Description = CopyString( description );

  armor->Value[OVAL_ARMOR_CONDITION] = armor->Value[OVAL_ARMOR_AC] = ud->ArmorValue;
  armor->Cost *= 10;
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

static bool CanUseWearLocation( int wearLocation )
{
  return wearLocation == ITEM_WEAR_BODY
    || wearLocation == ITEM_WEAR_HEAD
    || wearLocation == ITEM_WEAR_LEGS
    || wearLocation == ITEM_WEAR_FEET
    || wearLocation == ITEM_WEAR_ARMS
    || wearLocation == ITEM_WEAR_ABOUT
    || wearLocation == ITEM_WEAR_WAIST
    || wearLocation == ITEM_WEAR_OVER;
}
