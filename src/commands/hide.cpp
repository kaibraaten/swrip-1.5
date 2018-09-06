#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_hide( Character *ch, std::string argument )
{
  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo( "You can't concentrate enough for that.\r\n" );
      return;
    }

  if ( ch->Mount )
    {
      ch->Echo( "You can't do that while mounted.\r\n" );
      return;
    }

  ch->Echo( "You make an attempt at stealth.\r\n" );

  if ( IsAffectedBy(ch, AFF_HIDE) )
    RemoveBit(ch->AffectedBy, AFF_HIDE);

  if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_hide] )
    {
      SetBit(ch->AffectedBy, AFF_HIDE);
      LearnFromSuccess( ch, gsn_hide );
    }
  else
    {
      LearnFromFailure( ch, gsn_hide );
    }
}

