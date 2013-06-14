#include "mud.h"
#include "character.h"

/*
 * Generic area attack                                          -Thoric
 */
ch_ret spell_area_attack( int sn, int level, Character *caster, void *vo )
{
  Character *vch, *vch_next;
  SKILLTYPE *skill = get_skilltype(sn);
  bool affects = FALSE;
  ch_ret retcode = rNONE;

  send_to_char("You feel the hatred grow within you!\r\n", caster);
  caster->alignment -= 100;
  caster->alignment = URANGE( -1000, caster->alignment, 1000 );
  sith_penalty( caster );

  if ( IS_SET( caster->in_room->room_flags, ROOM_SAFE ) )
    {
      failed_casting( skill, caster, NULL, NULL );
      return rSPELL_FAILED;
    }

  affects = skill->affects ? TRUE : FALSE;

  if ( skill->hit_char && skill->hit_char[0] != '\0' )
    {
      act( AT_MAGIC, skill->hit_char, caster, NULL, NULL, TO_CHAR );
    }

  if ( skill->hit_room && skill->hit_room[0] != '\0' )
    {
      act( AT_MAGIC, skill->hit_room, caster, NULL, NULL, TO_ROOM );
    }

  for ( vch = caster->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;

      if ( !IsNpc( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
           && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
	{
	  continue;
	}

      if ( vch != caster && ( IsNpc(caster) ? !IsNpc(vch) : IsNpc(vch) ) )
        {
	  int dam = 0;
          bool saved = check_save( sn, level, caster, vch );

          if ( saved && !SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
            {
              failed_casting( skill, caster, vch, NULL );
              dam = 0;
            }
          else if ( skill->dice )
	    {
	      dam = dice_parse(caster, level, skill->dice);
	    }
	  else
	    {
	      dam = dice( 1, level );
	    }

          if ( saved && SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
	    {
	      dam /= 2;
	    }

          if ( is_affected_by(vch, AFF_PROTECT) && is_evil(caster) )
	    {
	      dam -= (int) (dam / 4);
	    }

          retcode = damage( caster, vch, dam, sn );
        }

      if ( retcode == rNONE && affects && !char_died(caster) && !char_died(vch) )
	{
	  retcode = spell_affectchar( sn, level, caster, vch );
	}

      if ( retcode == rCHAR_DIED || char_died(caster) )
        {
          break;
	}
    }

  return retcode;
}
