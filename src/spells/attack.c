#include "mud.h"
#include "character.h"

/*
 * Generic offensive spell damage attack                        -Thoric
 */
ch_ret spell_attack( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Skill *skill = get_skilltype(sn);
  bool saved = CheckSavingThrow( sn, level, ch, victim );
  int dam;
  ch_ret retcode;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  if ( saved && !SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
    {
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( skill->dice )
    dam = umax( 0, dice_parse( ch, level, skill->dice ) );
  else
    dam = RollDice( 1, level );

  if ( saved )
    dam /= 2;

  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  retcode = InflictDamage( ch, victim, dam, sn );

  if ( retcode == rNONE && skill->affects
       &&  !CharacterDiedRecently(ch) && !CharacterDiedRecently(victim) )
    retcode = spell_affectchar( sn, level, ch, victim );

  return retcode;
}
