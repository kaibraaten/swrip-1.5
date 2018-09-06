#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_noemote( Character *ch, std::string arg )
{
  Character *victim = nullptr;

  if ( arg.empty() )
    {
      ch->Echo("Noemote whom?\r\n");
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

  if ( IsBitSet(victim->Flags, PLR_NO_EMOTE) )
    {
      RemoveBit(victim->Flags, PLR_NO_EMOTE);
      victim->Echo("You can emote again.\r\n");
      ch->Echo("NO_EMOTE removed.\r\n");
    }
  else
    {
      SetBit(victim->Flags, PLR_NO_EMOTE);
      victim->Echo("You can't emote!\r\n");
      ch->Echo("NO_EMOTE set.\r\n");
    }
}
