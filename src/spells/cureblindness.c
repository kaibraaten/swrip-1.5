#include "character.h"
#include "mud.h"
#include "skill.h"

ch_ret spell_cure_blindness( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( !IsAffected( victim, gsn_blindness ) )
    return rSPELL_FAILED;

  if ( ch != victim )
    {
      SendToCharacter("The noble Jedi use their powers to help others!\r\n", ch);
      ch->alignment = ch->alignment +25 ;
      ch->alignment = urange( -1000, ch->alignment, 1000 );
      ApplyJediBonus(ch);
    }

  StripAffect( victim, gsn_blindness );
  SetCharacterColor( AT_MAGIC, victim);
  SendToCharacter( "Your vision returns!\r\n", victim );

  if ( ch != victim )
    SendToCharacter( "Ok.\r\n", ch );

  return rNONE;
}
