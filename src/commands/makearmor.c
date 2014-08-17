#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

struct UserData
{
  int ArmorValue;
  int WearLocation;
  char *ItemName;
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
  struct UserData *data;

  CREATE( data, struct UserData, 1 );

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
  argument = one_argument( argument, wearLoc );
  strcpy( name, argument );

  if ( name[0] == '\0' )
    {
      send_to_char( "&RUsage: Makearmor <wearloc> <name>\r\n&w", ch);
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
      ch_printf( ch, "&RYou cannot make clothing for that body part.\r\n&w" );
      eventArgs->AbortSession = true;
      return;
    }

  ud->ItemName = str_dup( name );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *eventArgs )
{
  if( eventArgs->Object->item_type == ITEM_FABRIC )
    {
      struct UserData *ud = (struct UserData*) userData;
      ud->ArmorValue = eventArgs->Object->value[OVAL_FABRIC_STRENGTH];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  struct UserData *ud = (struct UserData*) userData;
  OBJ_DATA *armor = eventArgs->Object;
  char description[MAX_STRING_LENGTH];

  armor->item_type = ITEM_ARMOR;
  SET_BIT( armor->wear_flags, ITEM_TAKE );
  SET_BIT( armor->wear_flags, ud->WearLocation );

  DISPOSE( armor->name );
  armor->name = str_dup( ud->ItemName );

  DISPOSE( armor->short_descr );
  armor->short_descr = str_dup( ud->ItemName );

  DISPOSE( armor->description );
  sprintf( description, "%s was dropped here.", capitalize( ud->ItemName ) );
  armor->description = str_dup( description );

  armor->value[OVAL_ARMOR_CONDITION] = armor->value[OVAL_ARMOR_AC] = ud->ArmorValue;
  armor->cost *= 10;
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
    || wearLocation == ITEM_WEAR_HEAD
    || wearLocation == ITEM_WEAR_LEGS
    || wearLocation == ITEM_WEAR_FEET
    || wearLocation == ITEM_WEAR_ARMS
    || wearLocation == ITEM_WEAR_ABOUT
    || wearLocation == ITEM_WEAR_WAIST
    || wearLocation == ITEM_WEAR_OVER;
}
