#include "mud.hpp"
#include "character.hpp"

void do_notell( Character *ch, std::string arg )
{
  Character *victim = nullptr;

  if ( arg.empty() )
    {
      ch->Echo("Notell whom?");
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

  if ( IsBitSet(victim->Flags, PLR_NO_TELL) )
    {
      RemoveBit(victim->Flags, PLR_NO_TELL);
      victim->Echo("You can tell again.\r\n");
      ch->Echo("NO_TELL removed.\r\n");
    }
  else
    {
      SetBit(victim->Flags, PLR_NO_TELL);
      victim->Echo("You can't tell!\r\n");
      ch->Echo("NO_TELL set.\r\n");
    }
}
