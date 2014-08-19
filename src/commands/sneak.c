#include "character.h"
#include "mud.h"

void do_sneak( Character *ch, char *argument )
{
  Affect af;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  SendToCharacter( "You attempt to move silently.\r\n", ch );
  StripAffect( ch, gsn_sneak );

  if ( IsNpc(ch) || GetRandomPercent( ) < ch->pcdata->learned[gsn_sneak] )
    {
      af.type      = gsn_sneak;
      af.duration  = GetAbilityLevel( ch, SMUGGLING_ABILITY ) * DUR_CONV;
      af.location  = APPLY_NONE;
      af.modifier  = 0;
      af.bitvector = AFF_SNEAK;
      AffectToCharacter( ch, &af );
      LearnFromSuccess( ch, gsn_sneak );
    }
  else
    LearnFromFailure( ch, gsn_sneak );
}
