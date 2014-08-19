#include "character.h"
#include "mud.h"

ch_ret spell_charm_person( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  int charm_chance;
  char buf[MAX_STRING_LENGTH];
  Skill *skill = get_skilltype(sn);

  if ( victim == ch )
    {
      SendToCharacter( "You like yourself even better!\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( IsBitSet( victim->immune, RIS_MAGIC )
       ||   IsBitSet( victim->immune, RIS_CHARM ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( (!IsNpc( victim ) && !IsNpc( ch )) || ch->race == RACE_DROID )
    {
      SendToCharacter( "I don't think so...\r\n", ch );
      SendToCharacter( "You feel as if someone tried to enter your mind but failed..\r\n", victim );
      return rSPELL_FAILED;
    }

  charm_chance = ris_save( victim, level, RIS_CHARM );

  if ( IsAffectedBy(victim, AFF_CHARM)
       ||   charm_chance == 1000
       ||   IsAffectedBy(ch, AFF_CHARM)
       ||   level < victim->top_level
       ||        IsFollowingInCircle( victim, ch )
       ||   saves_spell_staff( charm_chance, victim ) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( victim->master )
    StopFollowing( victim );

  StartFollowing( victim, ch );
  af.type      = sn;
  af.duration  = (NumberFuzzy( (level + 1) / 3 ) + 1) * DUR_CONV;
  af.location  = 0;
  af.modifier  = 0;
  af.bitvector = AFF_CHARM;
  AffectToCharacter( victim, &af );
  Act( AT_MAGIC, "Isn't $n just so nice?", ch, NULL, victim, TO_VICT );
  Act( AT_MAGIC, "$N's eyes glaze over...", ch, NULL, victim, TO_ROOM );

  if ( ch != victim )
    SendToCharacter( "Ok.\r\n", ch );

  sprintf( buf, "%s has charmed %s.", ch->name, victim->name);
  LogStringPlus( buf, LOG_NORMAL, ch->top_level );

  return rNONE;
}
