#include "character.h"
#include "mud.h"

ch_ret spell_burning_hands( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  static const short dam_each[] =
    {
      1,
      3,  5,  7,  9,    14,     17, 20, 23, 26, 29,
      29, 29, 30, 30,   31,     31, 32, 32, 33, 33,
      34, 34, 35, 35,   36,     36, 37, 37, 38, 38,
      39, 39, 40, 40,   41,     41, 42, 42, 43, 43,
      44, 44, 45, 45, 46, 46, 47, 47, 48, 48,
      49, 49, 50, 50, 51, 51, 52, 52, 53, 53,
      54, 54, 55, 55, 56, 56, 57, 57, 58, 58
    };
  int dam = 0;


  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  level = UMIN(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = UMAX(0, level);
  dam = number_range( dam_each[level] / 2, dam_each[level] * 2 );

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
