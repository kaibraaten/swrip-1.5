#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  std::string ItemName;
  int WearLocation = 0;
  long Cost = 0;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );
static void FreeUserData( struct UserData *ud );
static bool CanUseWearLocation( int wearLocation );

void do_makejewelry( Character *ch, std::string argument )
{
  UserData *data = new UserData();
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
  AddCheckRequirementsCraftingHandler( session, data, CheckRequirementsHandler );
  AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
  AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, data, AbortHandler );

  StartCrafting( session );
}

static CraftRecipe *MakeCraftRecipe( void )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,     CRAFTFLAG_NONE },
      { ITEM_OVEN,        CRAFTFLAG_NONE },
      { ITEM_RARE_METAL,  CRAFTFLAG_EXTRACT },
      { ITEM_CRYSTAL,     CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_NONE,        CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makejewelry, materials,
					     15, OBJ_VNUM_CRAFTING_ARMOR,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );
  std::string argument = args->CommandArguments;
  std::string wearLoc;
  std::string name;

  argument = OneArgument( argument, wearLoc );
  name = argument;

  if ( name.empty() )
    {
      ch->Echo("&RUsage: Makejewelry <wearloc> <name>\r\n&w" );
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
      ch->Echo("&RYou cannot make jewelry for that body part.\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = name;
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{

}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->ItemType == ITEM_RARE_METAL )
    {
      ud->Cost += args->Object->Cost;
    }

  if( args->Object->ItemType == ITEM_CRYSTAL )
    {
      ud->Cost += args->Object->Cost;
      args->KeepFinding = true;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *obj = args->Object;

  SetBit( obj->WearFlags, ITEM_TAKE );
  SetBit( obj->WearFlags, ud->WearLocation );

  strcpy( buf, ud->ItemName.c_str() );
  obj->Name = buf;

  strcpy( buf, ud->ItemName.c_str() );
  obj->ShortDescr = buf;

  strcat( buf, " was dropped here." );
  obj->Description = Capitalize( buf );

  obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];

  obj->Cost += ud->Cost;
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
  delete ud;
}

static bool CanUseWearLocation( int wearLocation )
{
  return wearLocation == ITEM_WEAR_FINGER
    || wearLocation == ITEM_WEAR_NECK
    || wearLocation == ITEM_WEAR_HEAD
    || wearLocation == ITEM_WEAR_WRIST
    || wearLocation == ITEM_WEAR_EARS;
}


