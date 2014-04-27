#include "character.h"
#include "mud.h"

ch_ret spell_know_alignment( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  char *msg;
  int ap;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( !victim )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  ap = victim->alignment;

  if ( ap >  700 ) msg = "$N has an aura as white as the driven snow.";
  else if ( ap >  350 ) msg = "$N is of excellent moral character.";
  else if ( ap >  100 ) msg = "$N is often kind and thoughtful.";
  else if ( ap > -100 ) msg = "$N doesn't have a firm moral commitment.";
  else if ( ap > -350 ) msg = "$N lies to $S friends.";
  else if ( ap > -700 ) msg = "$N's slash DISEMBOWELS you!";
  else msg = "I'd rather just not say anything at all about $N.";

  act( AT_MAGIC, msg, ch, NULL, victim, TO_CHAR );
  return rNONE;
}
