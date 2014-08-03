#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "craft.h"

enum { ItemType, ItemName };

static void SetObjectStats( const CraftingSession *session, OBJ_DATA *obj )
{
  const char *itemType = GetCraftingArgument( session, ItemType );
  const char *itemName = GetCraftingArgument( session, ItemName );
  char description[MAX_STRING_LENGTH];

  int value = 0;

  obj->item_type = ITEM_CONTAINER;
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  value = get_wearflag( itemType );

  if ( value < 0 || value > 31 )
    SET_BIT( obj->wear_flags, ITEM_HOLD );
  else
    SET_BIT( obj->wear_flags, 1 << value );

  STRFREE( obj->name );
  obj->name = STRALLOC( itemName );

  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( itemName );

  STRFREE( obj->description );
  sprintf( description, "%s was dropped here.", itemName );
  obj->description = STRALLOC( description );

  obj->value[0] = obj->level;
  obj->value[1] = 0;
  obj->value[2] = 0;
  obj->value[3] = 10;
  obj->cost *= 2;
}

static bool InterpretArguments( CraftingSession *session, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  char arg2[MAX_STRING_LENGTH];
  Character *ch = GetEngineer( session );

  argument = one_argument( argument, arg );
  strcpy( arg2 , argument );

  if ( arg2[0] == '\0' )
    {
      send_to_char( "&RUsage: Makecontainer <wearloc> <name>\r\n&w", ch);
      return false;
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
      return false;
    }

  if ( !str_cmp( arg, "feet" )
       || !str_cmp( arg, "hands" ) )
    {
      send_to_char( "&RYou cannot make a container for that body part.\r\n&w", ch);
      send_to_char( "&RTry MAKEARMOR.\r\n&w", ch);
      return false;
    }

  if ( !str_cmp( arg, "shield" ) )
    {
      send_to_char( "&RYou cannot make a container a shield.\r\n&w", ch);
      send_to_char( "&RTry MAKESHIELD.\r\n&w", ch);
      return false;
    }

  if ( !str_cmp( arg, "wield" ) )
    {
      send_to_char( "&RAre you going to fight with a container?\r\n&w", ch);
      send_to_char( "&RTry MAKEBLADE...\r\n&w", ch);
      return false;
    }

  AddCraftingArgument( session, arg );
  AddCraftingArgument( session, arg2 );

  return true;
}

void do_test( Character *ch, char *argument )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_FABRIC, 1, CRAFTFLAG_EXTRACT },
      { ITEM_THREAD, 1, CRAFTFLAG_NONE },
      { ITEM_NONE, 0, CRAFTFLAG_NONE }
    };

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecontainer, materials,
					     10, OBJ_VNUM_CRAFTING_CONTAINER );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument,
						      InterpretArguments,
						      SetObjectStats );

  StartCrafting( session );
}
