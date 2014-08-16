#include "mud.h"
#include "character.h"

/*
 * Generic area attack                                          -Thoric
 */
ch_ret spell_area_attack( int sn, int level, Character *ch, void *vo )
{
  Character *vch, *vch_next;
  SKILLTYPE *skill = get_skilltype(sn);
  bool saved;
  bool affects;
  int dam;
  ch_ret retcode;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }

  affects = (skill->affects ? true : false);
  if ( skill->hit_char && skill->hit_char[0] != '\0' )
    act( AT_MAGIC, skill->hit_char, ch, NULL, NULL, TO_CHAR );
  if ( skill->hit_room && skill->hit_room[0] != '\0' )
    act( AT_MAGIC, skill->hit_room, ch, NULL, NULL, TO_ROOM );

  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;

      if ( !IsNpc( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
           && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
        continue;

      if ( vch != ch && ( IsNpc(ch) ? !IsNpc(vch) : IsNpc(vch) ) )
        {
          saved = check_save( sn, level, ch, vch );
          if ( saved && !SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
            {
              failed_casting( skill, ch, vch, NULL );
              dam = 0;
            }
          else
            if ( skill->dice )
              dam = dice_parse(ch, level, skill->dice);
            else
              dam = dice( 1, level );
          if ( saved && SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
            dam /= 2;
          if ( IsAffectedBy(vch, AFF_PROTECT) && is_evil(ch) )
            dam -= (int) (dam / 4);

          retcode = damage( ch, vch, dam, sn );
        }
      if ( retcode == rNONE && affects && !char_died(ch) && !char_died(vch) )
        retcode = spell_affectchar( sn, level, ch, vch );

      if ( retcode == rCHAR_DIED || char_died(ch) )
        {
          break;
	}
    }
  return retcode;
}
