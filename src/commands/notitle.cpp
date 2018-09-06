#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_notitle( Character *ch, std::string arg )
{
  Character *victim = NULL;

  if ( arg.empty() )
    {
      ch->Echo("Notitle whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo("You failed.\r\n");
      return;
    }

  if ( IsBitSet(victim->PCData->Flags, PCFLAG_NOTITLE) )
    {
      RemoveBit(victim->PCData->Flags, PCFLAG_NOTITLE);
      victim->Echo("You can set your own title again.\r\n");
      ch->Echo("NOTITLE removed.\r\n");
    }
  else
    {
      SetBit(victim->PCData->Flags, PCFLAG_NOTITLE);
      SetCharacterTitle( victim, victim->Name );
      victim->Echo("You can't set your own title!\r\n");
      ch->Echo("NOTITLE set.\r\n");
    }
}

