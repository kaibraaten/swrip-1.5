#include "character.h"
#include "mud.h"
#include "skill.h"

extern char *spell_target_name;

ch_ret spell_possess( int sn, int level, Character *ch, void *vo )
{
  Character *victim;
  char buf[MAX_STRING_LENGTH];
  Affect af;
  Skill *skill = GetSkill(sn);

  if (ch->desc->original)
    {
      SendToCharacter("You are not in your original state.\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( (victim = GetCharacterInRoom( ch, spell_target_name ) ) == NULL)
    {
      SendToCharacter("They aren't here!\r\n", ch);
      return rSPELL_FAILED;
    }

  if (victim == ch)
    {
      SendToCharacter("You can't possess yourself!\r\n", ch);
      return rSPELL_FAILED;
    }

  if (!IsNpc(victim))
    {
      SendToCharacter("You can't possess another player!\r\n", ch);
      return rSPELL_FAILED;
    }

  if ( victim->race == RACE_DROID )
    {
      SendToCharacter("The brain of a machine confuses you.\r\n", ch);
      return rSPELL_FAILED;
    }

  if (victim->desc)
    {
      Echo(ch, "%s is already possessed.\r\n", victim->short_descr);
      return rSPELL_FAILED;
    }

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IsAffectedBy(victim, AFF_POSSESS)
       ||   level < (victim->top_level + 30)
       ||  victim->desc
       ||  !Chance(ch, 25) )
    {
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  SendToCharacter("You feel the hatred grow within you as you twist your victims mind!\r\n", ch);
  ch->alignment = ch->alignment - 50;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  af.Type      = sn;
  af.Duration  = 20 + (GetAbilityLevel( ch, FORCE_ABILITY ) - victim->top_level) / 2;
  af.Location  = 0;
  af.Modifier  = 0;
  af.AffectedBy = AFF_POSSESS;
  AffectToCharacter( victim, &af );

  sprintf(buf, "You have possessed %s!\r\n", victim->short_descr);

  ch->desc->character = victim;
  ch->desc->original  = ch;
  victim->desc        = ch->desc;
  ch->desc            = NULL;
  ch->switched        = victim;
  SendToCharacter( buf, victim );

  return rNONE;
}
