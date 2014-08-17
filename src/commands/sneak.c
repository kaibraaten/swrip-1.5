#include "character.h"
#include "mud.h"

void do_sneak( Character *ch, char *argument )
{
  Affect af;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  send_to_char( "You attempt to move silently.\r\n", ch );
  affect_strip( ch, gsn_sneak );

  if ( IsNpc(ch) || GetRandomPercent( ) < ch->pcdata->learned[gsn_sneak] )
    {
      af.type      = gsn_sneak;
      af.duration  = GetAbilityLevel( ch, SMUGGLING_ABILITY ) * DUR_CONV;
      af.location  = APPLY_NONE;
      af.modifier  = 0;
      af.bitvector = AFF_SNEAK;
      affect_to_char( ch, &af );
      learn_from_success( ch, gsn_sneak );
    }
  else
    learn_from_failure( ch, gsn_sneak );
}
