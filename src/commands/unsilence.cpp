#include "mud.hpp"
#include "character.hpp"

void do_unsilence( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Unsilence whom?\r\n");
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

  if ( IsBitSet(victim->Flags, PLR_SILENCE) )
    {
      RemoveBit(victim->Flags, PLR_SILENCE);
      victim->Echo("You can use channels again.\r\n");
      ch->Echo("SILENCE removed.\r\n");
    }
  else
    {
      ch->Echo("That player is not silenced.\r\n");
    }
}

