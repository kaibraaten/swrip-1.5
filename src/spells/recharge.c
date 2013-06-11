#include "character.h"
#include "mud.h"

ch_ret spell_recharge( int sn, int level, Character *ch, void *vo )
{
  OBJ_DATA *obj = (OBJ_DATA *) vo;

  if ( obj->item_type == ITEM_STAFF
       ||   obj->item_type == ITEM_WAND)
    {
      separate_obj(obj);
      if ( obj->value[2] == obj->value[1]
           ||   obj->value[1] > (obj->pIndexData->value[1] * 4) )
        {
          act( AT_FIRE, "$p bursts into flames, injuring you!", ch, obj, NULL, TO_CHAR );
          act( AT_FIRE, "$p bursts into flames, charring $n!", ch, obj, NULL, TO_ROOM);
          extract_obj(obj);
          if ( damage(ch, ch, obj->level * 2, TYPE_UNDEFINED) == rCHAR_DIED
               ||   char_died(ch) )
            return rCHAR_DIED;
          else
            return rSPELL_FAILED;
        }

      if ( chance(ch, 2) )
        {
          act( AT_YELLOW, "$p glows with a blinding magical luminescence.",
               ch, obj, NULL, TO_CHAR);
          obj->value[1] *= 2;
          obj->value[2] = obj->value[1];
          return rNONE;
        }
      else
        if ( chance(ch, 5) )
          {
            act( AT_YELLOW, "$p glows brightly for a few seconds...",
                 ch, obj, NULL, TO_CHAR);
            obj->value[2] = obj->value[1];
	    return rNONE;
          }
        else
          if ( chance(ch, 10) )
            {
              act( AT_WHITE, "$p disintegrates into a void.", ch, obj, NULL, TO_CHAR);
              act( AT_WHITE, "$n's attempt at recharging fails, and $p disintegrates.",
                   ch, obj, NULL, TO_ROOM);
              extract_obj(obj);
              return rSPELL_FAILED;
            }
          else
            if ( chance(ch, 50 - (GetLevel( ch, FORCE_ABILITY ) ) ) )
              {
                send_to_char("Nothing happens.\r\n", ch);
                return rSPELL_FAILED;
              }
            else
              {
                act( AT_MAGIC, "$p feels warm to the touch.", ch, obj, NULL, TO_CHAR);
                --obj->value[1];
                obj->value[2] = obj->value[1];
                return rNONE;
              }
    }
  else
    {
      send_to_char( "You can't recharge that!\r\n", ch);
      return rSPELL_FAILED;
    }
}
