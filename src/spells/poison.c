#include "character.h"
#include "mud.h"

ch_ret spell_poison( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  int poison_chance;
  bool first = true;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  poison_chance = ris_save( victim, level, RIS_POISON );

  if ( poison_chance == 1000 || saves_poison_death( poison_chance, victim ) )
    return rSPELL_FAILED;

  if ( IsAffectedBy( victim, AFF_POISON ) )
    first = false;

  af.type      = sn;
  af.duration  = level * DUR_CONV;
  af.location  = APPLY_STR;
  af.modifier  = -2;
  af.bitvector = AFF_POISON;
  affect_join( victim, &af );
  set_char_color( AT_MAGIC, victim );
  send_to_char( "You feel very sick.\r\n", victim );
  victim->mental_state = URANGE( 20, victim->mental_state
                                 + (first ? 5 : 0), 100 );
  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );
  return rNONE;
}
