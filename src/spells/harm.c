#include "mud.h"
#include "character.h"

ch_ret spell_harm( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  dam = UMAX(  20, victim->hit - dice(1,4) );

  if ( saves_spell_staff( level, victim ) )
    dam = UMIN( 50, dam / 4 );
  dam = UMIN( 100, dam );

  if ( IsAffectedBy(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
