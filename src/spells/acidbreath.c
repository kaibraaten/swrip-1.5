#include "mud.h"
#include "character.h"

ch_ret spell_acid_breath( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  OBJ_DATA *obj_lose;
  OBJ_DATA *obj_next;
  int dam;
  int hpch;

  if ( chance(ch, 2 * level) && !saves_breath( level, victim ) )
    {
      for ( obj_lose = victim->first_carrying; obj_lose; obj_lose = obj_next )
        {
          int iWear;

          obj_next = obj_lose->next_content;

          if ( number_bits( 2 ) != 0 )
            continue;

          switch ( obj_lose->item_type )
            {
            case ITEM_ARMOR:
              if ( obj_lose->value[0] > 0 )
                {
                  separate_obj(obj_lose);
                  act( AT_DAMAGE, "$p is pitted and etched!",
                       victim, obj_lose, NULL, TO_CHAR );
                  if ( ( iWear = obj_lose->wear_loc ) != WEAR_NONE )
                    victim->armor -= apply_ac( obj_lose, iWear );

		  obj_lose->value[0] -= 1;
                  obj_lose->cost      = 0;
                  if ( iWear != WEAR_NONE )
		    if ( iWear != WEAR_NONE )
		      victim->armor += apply_ac( obj_lose, iWear );
                }
              break;

            case ITEM_CONTAINER:
              separate_obj( obj_lose );
              act( AT_DAMAGE, "$p fumes and dissolves!",
                   victim, obj_lose, NULL, TO_CHAR );
              act( AT_OBJECT, "The contents of $p spill out onto the ground.",
                   victim, obj_lose, NULL, TO_ROOM );
              act( AT_OBJECT, "The contents of $p spill out onto the ground.",
                   victim, obj_lose, NULL, TO_CHAR );
              empty_obj( obj_lose, NULL, victim->in_room );
              extract_obj( obj_lose );
              break;
            }
        }
    }

  hpch = UMAX( 10, ch->hit );
  dam  = number_range( hpch/16+1, hpch/8 );
  if ( saves_breath( level, victim ) )
    dam /= 2;
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);
  return damage( ch, victim, dam, sn );
}
