#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "craft.h"

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
  static struct CraftingMaterial materials[] =
    {
      { ITEM_FABRIC, 1, CRAFTFLAG_EXTRACT },
      { ITEM_THREAD, 1, CRAFTFLAG_NONE },
      { ITEM_NONE, 0, CRAFTFLAG_NONE }
    };

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makecontainer, materials,
					     10, OBJ_VNUM_CRAFTING_CONTAINER );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument,
						      InterpretArguments );

  StartCrafting( session );
}
