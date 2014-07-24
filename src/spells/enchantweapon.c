#include "mud.h"
#include "character.h"

ch_ret spell_enchant_weapon( int sn, int level, Character *ch, void *vo )
{
  OBJ_DATA *obj = (OBJ_DATA *) vo;
  Affect *paf;

  if ( obj->item_type != ITEM_WEAPON
       ||   IS_OBJ_STAT(obj, ITEM_MAGIC)
       ||   obj->first_affect )
    return rSPELL_FAILED;

  /* Bug fix here. -- Alty */
  separate_obj(obj);
  CREATE( paf, Affect, 1 );
  paf->type             = -1;
  paf->duration = -1;
  paf->location = APPLY_HITROLL;
  paf->modifier = level / 15;
  paf->bitvector        = 0;
  LINK( paf, obj->first_affect, obj->last_affect, next, prev );

  CREATE( paf, Affect, 1 );
  paf->type             = -1;
  paf->duration = -1;
  paf->location = APPLY_DAMROLL;
  paf->modifier = level / 15;
  paf->bitvector        = 0;
  LINK( paf, obj->first_affect, obj->last_affect, next, prev );

  if ( is_good(ch) )
    {
      SET_BIT(obj->extra_flags, ITEM_ANTI_EVIL);
      act( AT_BLUE, "$p glows blue.", ch, obj, NULL, TO_CHAR );
    }
  else if ( is_evil(ch) )
    {
      SET_BIT(obj->extra_flags, ITEM_ANTI_GOOD);
      act( AT_RED, "$p glows red.", ch, obj, NULL, TO_CHAR );
    }
  else
    {
      SET_BIT(obj->extra_flags, ITEM_ANTI_EVIL);
      SET_BIT(obj->extra_flags, ITEM_ANTI_GOOD);
      act( AT_YELLOW, "$p glows yellow.", ch, obj, NULL, TO_CHAR );
    }

  send_to_char( "Ok.\r\n", ch );
  return rNONE;
}
