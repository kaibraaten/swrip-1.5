#include "character.h"
#include "mud.h"
#include "skill.h"

void do_return( Character *ch, char *argument )
{
  if ( !ch->Desc )
    return;

  if ( !ch->Desc->Original )
    {
      SendToCharacter( "You aren't switched.\r\n", ch );
      return;
    }

  if (IsBitSet(ch->Flags, ACT_POLYMORPHED))
    {
      SendToCharacter("Use revert to return from a polymorphed mob.\r\n", ch);
      return;
    }

  SendToCharacter( "You return to your original body.\r\n", ch );

  if ( IsNpc( ch ) && IsAffectedBy( ch, AFF_POSSESS ) )
    {
      StripAffect( ch, gsn_possess );
      RemoveBit( ch->AffectedBy, AFF_POSSESS );
    }

  ch->Desc->Character       = ch->Desc->Original;
  ch->Desc->Original        = NULL;
  ch->Desc->Character->Desc = ch->Desc;
  ch->Desc->Character->Switched = NULL;
  ch->Desc                  = NULL;
}
