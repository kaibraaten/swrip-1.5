#include "character.h"
#include "mud.h"

ch_ret spell_cure_poison( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Skill *skill = get_skilltype(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IsAffected( victim, gsn_poison ) )
    {
      if ( ch != victim )
        {
          SendToCharacter("The noble Jedi use their powers to help others!\r\n", ch);
          ch->alignment = ch->alignment +25 ;
          ch->alignment = urange( -1000, ch->alignment, 1000 );
          jedi_bonus(ch);
        }

      affect_strip( victim, gsn_poison );
      act( AT_MAGIC, "$N looks better.", ch, NULL, victim, TO_NOTVICT );
      SetCharacterColor( AT_MAGIC, victim);
      SendToCharacter( "A warm feeling runs through your body.\r\n", victim );
      victim->mental_state = urange( -100, victim->mental_state, -10 );
      SendToCharacter( "Ok.\r\n", ch );
      return rNONE;
    }
  else
    return rSPELL_FAILED;
}
