#include "mud.h"
#include "character.h"

void do_brandish( Character *ch, char *argument )
{
  Character *vch = NULL;
  Character *vch_next = NULL;
  Object *staff = NULL;
  ch_ret retcode = rNONE;
  int sn = 0;

  if ( ( staff = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL )
    {
      SendToCharacter( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( staff->item_type != ITEM_STAFF )
    {
      SendToCharacter( "You can brandish only with a staff.\r\n", ch );
      return;
    }

  if ( ( sn = staff->value[3] ) < 0
       ||   sn >= top_sn
       ||   skill_table[sn]->spell_fun == NULL )
    {
      bug( "Do_brandish: bad sn %d.", sn );
      return;
    }

  SetWaitState( ch, 2 * PULSE_VIOLENCE );

  if ( staff->value[2] > 0 )
    {
      if ( !oprog_use_trigger( ch, staff, NULL, NULL, NULL ) )
        {
          act( AT_MAGIC, "$n brandishes $p.", ch, staff, NULL, TO_ROOM );
          act( AT_MAGIC, "You brandish $p.",  ch, staff, NULL, TO_CHAR );
        }
      for ( vch = ch->in_room->first_person; vch; vch = vch_next )
	{
          vch_next      = vch->next_in_room;
          if ( !IsNpc( vch ) && IsBitSet( vch->act, PLR_WIZINVIS )
               && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
            continue;
          else
            switch ( skill_table[sn]->target )
              {
              default:
                bug( "Do_brandish: bad target for sn %d.", sn );
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

          retcode = obj_cast_spell( staff->value[3], staff->value[0], ch, vch, NULL );
          if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
            {
              bug( "do_brandish: char died", 0 );
              return;
            }
        }
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
