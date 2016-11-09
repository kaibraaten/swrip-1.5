#include "character.hpp"
#include "mud.h"
#include "skill.h"

ch_ret spell_charm_person( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  int charm_chance;
  char buf[MAX_STRING_LENGTH];
  Skill *skill = GetSkill(sn);

  if ( victim == ch )
    {
      SendToCharacter( "You like yourself even better!\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( IsBitSet( victim->Immune, RIS_MAGIC )
       ||   IsBitSet( victim->Immune, RIS_CHARM ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( (!IsNpc( victim ) && !IsNpc( ch )) || ch->Race == RACE_DROID )
    {
      SendToCharacter( "I don't think so...\r\n", ch );
      SendToCharacter( "You feel as if someone tried to enter your mind but failed..\r\n", victim );
      return rSPELL_FAILED;
    }

  charm_chance = ModifySavingThrowBasedOnResistance( victim, level, RIS_CHARM );

  if ( IsAffectedBy(victim, AFF_CHARM)
       ||   charm_chance == 1000
       ||   IsAffectedBy(ch, AFF_CHARM)
       ||   level < victim->TopLevel
       ||        IsFollowingInCircle( victim, ch )
       ||   SaveVsSpellStaff( charm_chance, victim ) )
    {
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( victim->Master )
    StopFollowing( victim );

  StartFollowing( victim, ch );
  af.Type      = sn;
  af.Duration  = (NumberFuzzy( (level + 1) / 3 ) + 1) * DUR_CONV;
  af.Location  = 0;
  af.Modifier  = 0;
  af.AffectedBy = AFF_CHARM;
  AffectToCharacter( victim, &af );
  Act( AT_MAGIC, "Isn't $n just so nice?", ch, NULL, victim, TO_VICT );
  Act( AT_MAGIC, "$N's eyes glaze over...", ch, NULL, victim, TO_ROOM );

  if ( ch != victim )
    SendToCharacter( "Ok.\r\n", ch );

  sprintf( buf, "%s has charmed %s.", ch->Name, victim->Name);
  LogStringPlus( buf, LOG_NORMAL, ch->TopLevel );

  return rNONE;
}
