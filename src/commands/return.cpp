#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "descriptor.hpp"

void do_return( Character *ch, char *argument )
{
  if ( !ch->Desc )
    return;

  if ( !ch->Desc->Original )
    {
      ch->Echo("You aren't switched.\r\n");
      return;
    }

  if (IsBitSet(ch->Flags, ACT_POLYMORPHED))
    {
      ch->Echo("Use revert to return from a polymorphed mob.\r\n");
      return;
    }

  ch->Echo("You return to your original body.\r\n");

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

