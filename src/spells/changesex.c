#include "mud.h"

ch_ret spell_change_sex( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  AFFECT_DATA af;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( is_affected( victim, sn ) )
    return rSPELL_FAILED;

  af.type      = sn;
  af.duration  = 10 * level * DUR_CONV;
  af.location  = APPLY_SEX;

  do
    {
      af.modifier  = number_range( 0, 2 ) - victim->sex;
    }
  while ( af.modifier == 0 );

  af.bitvector = 0;
  affect_to_char( victim, &af );
  set_char_color( AT_MAGIC, victim );
  send_to_char( "You feel different.\r\n", victim );

  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );

  return rNONE;
}
