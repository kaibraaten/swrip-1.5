#include "character.h"
#include "mud.h"

ch_ret spell_cure_blindness( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( !is_affected( victim, gsn_blindness ) )
    return rSPELL_FAILED;

  if ( ch != victim )
    {
      send_to_char("The nobel Jedi use their powers to help others!\r\n", ch);
      ch->alignment = ch->alignment +25 ;
      ch->alignment = URANGE( -1000, ch->alignment, 1000 );
      jedi_bonus(ch);
    }

  affect_strip( victim, gsn_blindness );
  set_char_color( AT_MAGIC, victim);
  send_to_char( "Your vision returns!\r\n", victim );

  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );

  return rNONE;
}
