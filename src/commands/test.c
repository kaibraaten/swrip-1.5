#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "craft.h"
#include "character.h"

enum { WearLocation, ItemName };

struct UserData
{
  int Dummy;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{

}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
  struct UserData *data = (struct UserData*) userData;
  DISPOSE( data );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
  OBJ_DATA *obj = eventArgs->Object;
  const char *wearLocation = GetCraftingArgument( eventArgs->CraftingSession, WearLocation );
  const char *itemName = GetCraftingArgument( eventArgs->CraftingSession, ItemName );
  char description[MAX_STRING_LENGTH];
  int value = 0;

  obj->item_type = ITEM_CONTAINER;
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  value = get_wearflag( wearLocation );

  if ( value < 0 || value > 31 )
    SET_BIT( obj->wear_flags, ITEM_HOLD );
  else
    SET_BIT( obj->wear_flags, 1 << value );

  STRFREE( obj->name );
  obj->name = STRALLOC( itemName );

  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( itemName );

  STRFREE( obj->description );
  sprintf( description, "%s was dropped here.", capitalize( itemName ) );
  obj->description = STRALLOC( description );

  obj->value[0] = obj->level;
  obj->value[1] = 0;
  obj->value[2] = 0;
  obj->value[3] = 10;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
  CraftingSession *session = eventArgs->CraftingSession;
  char originalArgs[MAX_INPUT_LENGTH];
  char *argument = originalArgs;
  char arg[MAX_STRING_LENGTH];
  char arg2[MAX_STRING_LENGTH];
  Character *ch = GetEngineer( session );

  strcpy( argument, eventArgs->CommandArguments );
  argument = one_argument( argument, arg );
  strcpy( arg2, argument );

  if ( arg2[0] == '\0' )
    {
      send_to_char( "&RUsage: Makecontainer <wearloc> <name>\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "eyes" )
       || !str_cmp( arg, "ears" )
       || !str_cmp( arg, "finger" )
       || !str_cmp( arg, "neck" )
       || !str_cmp( arg, "floating" )
       || !str_cmp( arg, "over" )
       || !str_cmp( arg, "wrist" ) )
    {
      send_to_char( "&RYou cannot make a container for that body part.\r\n&w", ch);
      send_to_char( "&RTry MAKEJEWELRY.\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "feet" )
       || !str_cmp( arg, "hands" ) )
    {
      send_to_char( "&RYou cannot make a container for that body part.\r\n&w", ch);
      send_to_char( "&RTry MAKEARMOR.\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "shield" ) )
    {
      send_to_char( "&RYou cannot make a container a shield.\r\n&w", ch);
      send_to_char( "&RTry MAKESHIELD.\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "wield" ) )
    {
      send_to_char( "&RAre you going to fight with a container?\r\n&w", ch);
      send_to_char( "&RTry MAKEBLADE...\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  AddCraftingArgument( session, arg );
  AddCraftingArgument( session, arg2 );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  struct UserData *data = (struct UserData*) userData;
  DISPOSE( data );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *eventArgs )
{
  Character *ch = GetEngineer( eventArgs->CraftingSession );

  if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
    {
      ch_printf( ch, "&RYou need to be in a factory or workshop to do that.&w\r\n" );
      eventArgs->AbortSession = true;
      return;
    }
}

void do_test( Character *ch, char *argument )
{
  struct UserData *data;
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_FABRIC, CRAFTFLAG_EXTRACT },
      { ITEM_THREAD, CRAFTFLAG_NONE },
      { ITEM_NONE,   CRAFTFLAG_NONE }
    };

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecontainer, materials,
					     10, OBJ_VNUM_CRAFTING_CONTAINER );
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
