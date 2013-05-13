#include "mud.h"

ch_ret spell_blindness( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  AFFECT_DATA af;
  int tmp;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       &&  !IS_NPC(ch) && !IS_NPC(victim) )
    tmp = level;
  else
    tmp = level;

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( IS_AFFECTED(victim, AFF_BLIND) || saves_spell_staff( tmp, victim ) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  af.type      = sn;
  af.location  = APPLY_HITROLL;
  af.modifier  = -4;
  af.duration  = (1 + (level / 3)) * DUR_CONV;
  af.bitvector = AFF_BLIND;
  affect_to_char( victim, &af );
  set_char_color( AT_MAGIC, victim );
  send_to_char( "You are blinded!\r\n", victim );

  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );

  return rNONE;
}
