#include "character.h"
#include "mud.h"

ch_ret spell_curse( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( is_affected_by(victim, AFF_CURSE) || saves_spell_staff( level, victim ) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }
  af.type      = sn;
  af.duration  = (4*level) * DUR_CONV;
  af.location  = APPLY_HITROLL;
  af.modifier  = -1;
  af.bitvector = AFF_CURSE;
  affect_to_char( victim, &af );

  af.location  = APPLY_SAVING_SPELL;
  af.modifier  = 1;
  affect_to_char( victim, &af );

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 50;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  set_char_color( AT_MAGIC, victim);
  send_to_char( "You feel unclean.\r\n", victim );

  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );

  return rNONE;
}
