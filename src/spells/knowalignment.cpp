#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_know_alignment( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  char *msg;
  int ap;
  Skill *skill = GetSkill(sn);

  if ( !victim )
    {
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  ap = victim->Alignment;

  if ( ap >  700 ) msg = "$N has an aura as white as the driven snow.";
  else if ( ap >  350 ) msg = "$N is of excellent moral character.";
  else if ( ap >  100 ) msg = "$N is often kind and thoughtful.";
  else if ( ap > -100 ) msg = "$N doesn't have a firm moral commitment.";
  else if ( ap > -350 ) msg = "$N lies to $S friends.";
  else if ( ap > -700 ) msg = "$N's slash DISEMBOWELS you!";
  else msg = "I'd rather just not say anything at all about $N.";

  Act( AT_MAGIC, msg, ch, NULL, victim, TO_CHAR );
  return rNONE;
}

