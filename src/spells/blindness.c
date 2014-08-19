#include "character.h"
#include "mud.h"

ch_ret spell_blindness( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  int tmp;
  Skill *skill = get_skilltype(sn);

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       &&  !IsNpc(ch) && !IsNpc(victim) )
    tmp = level;
  else
    tmp = level;

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IsAffectedBy(victim, AFF_BLIND) || saves_spell_staff( tmp, victim ) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  af.type      = sn;
  af.location  = APPLY_HITROLL;
  af.modifier  = -4;
  af.duration  = (1 + (level / 3)) * DUR_CONV;
  af.bitvector = AFF_BLIND;
  AffectToCharacter( victim, &af );
  SetCharacterColor( AT_MAGIC, victim );
  SendToCharacter( "You are blinded!\r\n", victim );

  if ( ch != victim )
    SendToCharacter( "Ok.\r\n", ch );

  return rNONE;
}
