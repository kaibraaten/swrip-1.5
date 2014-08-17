#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

struct UserData
{
  char *ItemName;
  int WearLocation;
  long Cost;
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

void do_makejewelry( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  CREATE( data, struct UserData, 1 );

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
  char originalArgs[MAX_INPUT_LENGTH];
  char *argument = originalArgs;
  char wearLoc[MAX_STRING_LENGTH];
  char name[MAX_STRING_LENGTH];

  strcpy( argument, args->CommandArguments );
  argument = OneArgument( argument, wearLoc );
  strcpy( name, argument );

  if ( name[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makejewelry <wearloc> <name>\r\n&w" );
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
      ch_printf( ch, "&RYou cannot make jewelry for that body part.\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( name );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{

}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->item_type == ITEM_RARE_METAL )
    {
      ud->Cost += args->Object->cost;
    }

  if( args->Object->item_type == ITEM_CRYSTAL )
    {
      ud->Cost += args->Object->cost;
      args->KeepFinding = true;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *obj = args->Object;

  SetBit( obj->wear_flags, ITEM_TAKE );
  SetBit( obj->wear_flags, ud->WearLocation );

  DISPOSE( obj->name );
  strcpy( buf, ud->ItemName );
  obj->name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  DISPOSE( obj->short_descr );
  obj->short_descr = CopyString( buf );

  DISPOSE( obj->description );
  strcat( buf, " was dropped here." );
  obj->description = CopyString( Capitalize( buf ) );

  obj->value[OVAL_ARMOR_CONDITION] = obj->value[OVAL_ARMOR_AC];

  obj->cost += ud->Cost;
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
  return wearLocation == ITEM_WEAR_FINGER
    || wearLocation == ITEM_WEAR_NECK
    || wearLocation == ITEM_WEAR_HEAD
    || wearLocation == ITEM_WEAR_WRIST
    || wearLocation == ITEM_WEAR_EARS;
}
