#include "mud.h"

ch_ret spell_frost_breath( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  OBJ_DATA *obj_lose;
  OBJ_DATA *obj_next;
  int dam;
  int hpch;

  if ( chance( ch, 2 * level ) && !saves_breath( level, victim ) )
    {
      for ( obj_lose = victim->first_carrying; obj_lose;
            obj_lose = obj_next )
        {
          char *msg;

          obj_next = obj_lose->next_content;
          if ( number_bits( 2 ) != 0 )
            continue;

          switch ( obj_lose->item_type )
            {
            default:            continue;
            case ITEM_CONTAINER:
            case ITEM_DRINK_CON:
            case ITEM_POTION:   msg = "$p freezes and shatters!"; break;
            }

          separate_obj( obj_lose );
          act( AT_DAMAGE, msg, victim, obj_lose, NULL, TO_CHAR );
          if ( obj_lose->item_type == ITEM_CONTAINER )
            {
              act( AT_OBJECT, "The contents of $p spill out onto the ground.",
                   victim, obj_lose, NULL, TO_ROOM );
              act( AT_OBJECT, "The contents of $p spill out onto the ground.",
                   victim, obj_lose, NULL, TO_CHAR );
	      empty_obj( obj_lose, NULL, victim->in_room );
            }
          extract_obj( obj_lose );
        }
    }

  hpch = UMAX( 10, ch->hit );
  dam  = number_range( hpch/16+1, hpch/8 );
  if ( saves_breath( level, victim ) )
    dam /= 2;
  if ( IS_AFFECTED(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);
  return damage( ch, victim, dam, sn );
}
