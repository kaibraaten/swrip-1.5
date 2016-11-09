#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_sneak( Character *ch, char *argument )
{
  Affect af;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  SendToCharacter( "You attempt to move silently.\r\n", ch );
  StripAffect( ch, gsn_sneak );

  if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_sneak] )
    {
      af.Type      = gsn_sneak;
      af.Duration  = GetAbilityLevel( ch, SMUGGLING_ABILITY ) * DUR_CONV;
      af.Location  = APPLY_NONE;
      af.Modifier  = 0;
      af.AffectedBy = AFF_SNEAK;
      AffectToCharacter( ch, &af );
      LearnFromSuccess( ch, gsn_sneak );
    }
  else
    LearnFromFailure( ch, gsn_sneak );
}
