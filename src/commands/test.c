#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "craft.h"

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
  CraftingSession *session = AllocateCraftingSession( recipe, ch );




  FreeCraftingSession( session );
}
