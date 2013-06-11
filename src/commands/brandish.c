#include "mud.h"
#include "character.h"

void do_brandish( Character *ch, char *argument )
{
  OBJ_DATA *staff = NULL;
  ch_ret retcode = rNONE;
  int sn = 0;

  if ( ( staff = get_eq_char( ch, WEAR_HOLD ) ) == NULL )
    {
      send_to_char( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( staff->item_type != ITEM_STAFF )
    {
      send_to_char( "You can brandish only with a staff.\r\n", ch );
      return;
    }

  if ( ( sn = staff->value[3] ) < 0
       || sn >= top_sn
       || skill_table[sn]->spell_fun == NULL )
    {
      bug( "%s: bad sn %d.", __FUNCTION__, sn );
      return;
    }

  set_wait_state( ch, 2 * PULSE_VIOLENCE );

  if ( staff->value[2] > 0 )
    {
      CerisListIterator *iter = NULL;
      CerisList *people = NULL;

      if ( !oprog_use_trigger( ch, staff, NULL, NULL, NULL ) )
        {
          act( AT_MAGIC, "$n brandishes $p.", ch, staff, NULL, TO_ROOM );
          act( AT_MAGIC, "You brandish $p.",  ch, staff, NULL, TO_CHAR );
        }

      people = List_Copy( ch->in_room->People );
      iter = CreateListIterator( people, ForwardsIterator );

      for( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
	{
	  Character *vch = (Character*) ListIterator_GetData( iter );

          if ( !IsNpc( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
               && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
	    {
	      continue;
	    }
          else
	    {
	      switch ( skill_table[sn]->target )
		{
		default:
		  bug( "%s: bad target for sn %d.", __FUNCTION__, sn );
		  return;

		case TAR_IGNORE:
		  if ( vch != ch )
		    continue;
		  break;

		case TAR_CHAR_OFFENSIVE:
		  if ( IsNpc(ch) ? IsNpc(vch) : !IsNpc(vch) )
		    continue;
		  break;

		case TAR_CHAR_DEFENSIVE:
		  if ( IsNpc(ch) ? !IsNpc(vch) : IsNpc(vch) )
		    continue;
		  break;

		case TAR_CHAR_SELF:
		  if ( vch != ch )
		    continue;
		  break;
		}
	    }

          retcode = obj_cast_spell( staff->value[3], staff->value[0], ch, vch, NULL );

          if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
            {
	      DestroyListIterator( iter );
	      DestroyList( people );
              bug( "%s: char died", __FUNCTION__ );
              return;
            }
        }

      DestroyListIterator( iter );
      DestroyList( people );
    }

  if ( --staff->value[2] <= 0 )
    {
      act( AT_MAGIC, "$p blazes bright and vanishes from $n's hands!", ch, staff, NULL, TO_ROOM );
      act( AT_MAGIC, "$p blazes bright and is gone!", ch, staff, NULL, TO_CHAR );
      if ( staff->serial == cur_obj )
        global_objcode = rOBJ_USED;

      extract_obj( staff );
    }
}
