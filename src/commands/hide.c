#include "character.h"
#include "mud.h"
#include "skill.h"

void do_hide( Character *ch, char *argument )
{
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

  SendToCharacter( "You make an attempt at stealth.\r\n", ch );

  if ( IsAffectedBy(ch, AFF_HIDE) )
    RemoveBit(ch->affected_by, AFF_HIDE);

  if ( IsNpc(ch) || GetRandomPercent() < ch->pcdata->learned[gsn_hide] )
    {
      SetBit(ch->affected_by, AFF_HIDE);
      LearnFromSuccess( ch, gsn_hide );
    }
  else
    {
      LearnFromFailure( ch, gsn_hide );
    }
}
