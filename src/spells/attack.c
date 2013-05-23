#include "mud.h"
#include "character.h"

/*
 * Generic offensive spell damage attack                        -Thoric
 */
ch_ret spell_attack( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  SKILLTYPE *skill = get_skilltype(sn);
  bool saved = check_save( sn, level, ch, victim );
  int dam;
  ch_ret retcode;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  if ( saved && !SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( skill->dice )
    dam = UMAX( 0, dice_parse( ch, level, skill->dice ) );
  else
    dam = dice( 1, level );

  if ( saved )
    dam /= 2;

  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);

  retcode = damage( ch, victim, dam, sn );

  if ( retcode == rNONE && skill->affects
       &&  !char_died(ch) && !char_died(victim) )
    retcode = spell_affectchar( sn, level, ch, victim );

  return retcode;
}
