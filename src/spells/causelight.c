#include "mud.h"

ch_ret spell_cause_light( int sn, int level, CHAR_DATA *ch, void *vo )
{
  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 50;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  return damage( ch, (CHAR_DATA *) vo, dice(1, 8) + level / 3, sn );
}
