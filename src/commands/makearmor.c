#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

enum { WearLocation, ItemName };

struct UserData
{
  int ArmorValue;
};

static CraftRecipe *CreateMakeArmorRecipe( void );
static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );

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
      send_to_char( "&RUsage: Makearmor <wearloc> <name>\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "eyes" )
       || !str_cmp( arg, "ears" )
       || !str_cmp( arg, "finger" )
       || !str_cmp( arg, "neck" )
       || !str_cmp( arg, "floating" )
       || !str_cmp( arg, "wrist" ) )
    {
      send_to_char( "&RYou cannot make clothing for that body part.\r\n&w", ch);
      send_to_char( "&RTry MAKEJEWELRY.\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "shield" ) )
    {
      send_to_char( "&RYou cannot make clothing worn as a shield.\r\n&w", ch);
      send_to_char( "&RTry MAKESHIELD.\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  if ( !str_cmp( arg, "wield" ) )
    {
      send_to_char( "&RAre you going to fight with your clothing?\r\n&w", ch);
      send_to_char( "&RTry MAKEBLADE...\r\n&w", ch);
      eventArgs->AbortSession = true;
      return;
    }

  AddCraftingArgument( session, arg );
  AddCraftingArgument( session, arg2 );
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
  const char *wearLocation = GetCraftingArgument( eventArgs->CraftingSession, WearLocation );
  const char *itemName = GetCraftingArgument( eventArgs->CraftingSession, ItemName );
  char description[MAX_STRING_LENGTH];
  long value = 0;

  armor->item_type = ITEM_ARMOR;
  SET_BIT( armor->wear_flags, ITEM_TAKE );
  value = get_wearflag( wearLocation );

  if ( value < 0 || value > 31 )
    SET_BIT( armor->wear_flags, ITEM_WEAR_BODY );
  else
    SET_BIT( armor->wear_flags, 1 << value );

  STRFREE( armor->name );
  armor->name = STRALLOC( itemName );

  STRFREE( armor->short_descr );
  armor->short_descr = STRALLOC( itemName );

  STRFREE( armor->description );
  sprintf( description, "%s was dropped here.", capitalize( itemName ) );
  armor->description = STRALLOC( description );

  armor->value[OVAL_ARMOR_CONDITION] = armor->value[OVAL_ARMOR_AC] = ud->ArmorValue;
  armor->cost *= 10;
}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}
