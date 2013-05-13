#include "mud.h"

ch_ret spell_flamestrike( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  dam = dice(6, 8);

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  if ( IS_AFFECTED(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
