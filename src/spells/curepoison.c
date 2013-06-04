#include "character.h"
#include "mud.h"

ch_ret spell_cure_poison( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( is_affected( victim, gsn_poison ) )
    {
      if ( ch != victim )
        {
          send_to_char("The nobel Jedi use their powers to help others!\r\n", ch);
          ch->alignment = ch->alignment +25 ;
          ch->alignment = URANGE( -1000, ch->alignment, 1000 );
          jedi_bonus(ch);
        }

      affect_strip( victim, gsn_poison );
      act( AT_MAGIC, "$N looks better.", ch, NULL, victim, TO_NOTVICT );
      set_char_color( AT_MAGIC, victim);
      send_to_char( "A warm feeling runs through your body.\r\n", victim );
      victim->mental_state = URANGE( -100, victim->mental_state, -10 );
      send_to_char( "Ok.\r\n", ch );
      return rNONE;
    }
  else
    return rSPELL_FAILED;
}
