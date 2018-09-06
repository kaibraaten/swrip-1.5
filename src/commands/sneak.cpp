#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_sneak( Character *ch, std::string argument )
{
  Affect af;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo("You can't concentrate enough for that.\r\n");
      return;
    }

  if ( ch->Mount )
    {
      ch->Echo("You can't do that while mounted.\r\n");
      return;
    }

  ch->Echo("You attempt to move silently.\r\n");
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
