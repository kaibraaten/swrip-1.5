#include "character.h"
#include "mud.h"
#include "skill.h"

ch_ret spell_cure_poison( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IsAffected( victim, gsn_poison ) )
    {
      if ( ch != victim )
        {
          SendToCharacter("The noble Jedi use their powers to help others!\r\n", ch);
          ch->alignment = ch->alignment +25 ;
          ch->alignment = urange( -1000, ch->alignment, 1000 );
          ApplyJediBonus(ch);
        }

      StripAffect( victim, gsn_poison );
      Act( AT_MAGIC, "$N looks better.", ch, NULL, victim, TO_NOTVICT );
      SetCharacterColor( AT_MAGIC, victim);
      SendToCharacter( "A warm feeling runs through your body.\r\n", victim );
      victim->mental_state = urange( -100, victim->mental_state, -10 );
      SendToCharacter( "Ok.\r\n", ch );
      return rNONE;
    }
  else
    return rSPELL_FAILED;
}
