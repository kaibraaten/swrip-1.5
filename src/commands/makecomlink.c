#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

enum { WearLocation, ItemName };

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );

void do_makecomlink( Character *ch, char *argument )
{
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AddInterpretArgumentsCraftingHandler( session, NULL, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, NULL, SetObjectStatsHandler );

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
  Character *ch = GetEngineer( args->CraftingSession );
  char originalArgs[MAX_INPUT_LENGTH];
  char *argument = originalArgs;
  char wearloc[MAX_STRING_LENGTH];
  char itemname[MAX_STRING_LENGTH];

  strcpy( argument, args->CommandArguments );
  argument = one_argument( argument, wearloc );
  strcpy( itemname, argument );

  if ( itemname[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makecomlink <wearloc> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  if ( !str_cmp( wearloc, "body" )
       || !str_cmp( wearloc, "head" )
       || !str_cmp( wearloc, "legs" )
       || !str_cmp( wearloc, "arms" )
       || !str_cmp( wearloc, "about" )
       || !str_cmp( wearloc, "eyes" )
       || !str_cmp( wearloc, "waist" )
       || !str_cmp( wearloc, "hold" )
       || !str_cmp( wearloc, "feet" )
       || !str_cmp( wearloc, "hands" ) )
    {
      ch_printf( ch, "&RYou cannot make a comlink for that body part.\r\n&w" );
      args->AbortSession = true;
      return;
    }

  if ( !str_cmp( wearloc, "shield" ) )
    {
      ch_printf( ch, "&RYou cannot make a comlink worn as a shield.\r\n&w" );
      ch_printf( ch, "&RTry MAKESHIELD.\r\n&w" );
      args->AbortSession = true;
      return;
    }

  if ( !str_cmp( wearloc, "wield" ) )
    {
      ch_printf( ch, "&RAre you going to fight with your comlink?\r\n&w" );
      args->AbortSession = true;
      return;
    }

  AddCraftingArgument( args->CraftingSession, wearloc );
  AddCraftingArgument( args->CraftingSession, itemname );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  const char *wearLoc = GetCraftingArgument( args->CraftingSession, WearLocation );
  const char *itemName = GetCraftingArgument( args->CraftingSession, ItemName );
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *obj = args->Object;
  int value = 0;

  SET_BIT( obj->wear_flags, ITEM_TAKE );
  value = get_wearflag( wearLoc );

  if ( value < 0 || value > 31 )
    {
      SET_BIT( obj->wear_flags, ITEM_HOLD );
    }
  else
    {
      SET_BIT( obj->wear_flags, 1 << value );
    }

  obj->weight = 1;

  STRFREE( obj->name );
  strcpy( buf, itemName );
  strcat( buf, " comlink" );
  obj->name = STRALLOC( buf );

  strcpy( buf, itemName );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );

  STRFREE( obj->description );
  strcat( buf, " was left here." );
  obj->description = STRALLOC( capitalize( buf ) );

  obj->cost = 50;
}
