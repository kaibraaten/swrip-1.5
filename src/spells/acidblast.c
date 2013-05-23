#include "mud.h"
#include "character.h"

ch_ret spell_acid_blast( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );

  sith_penalty( ch );

  dam = dice( level, 6 );
  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);
  return damage( ch, victim, dam, sn );
}
