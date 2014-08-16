#include "character.h"
#include "mud.h"

ch_ret spell_flamestrike( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  dam = dice(6, 8);

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  if ( IsAffectedBy(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
