#include "character.hpp"
#include "mud.hpp"

void do_silence( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Silence whom?");
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
      ch->Echo("Player already silenced, use unsilence to remove.\r\n");
    }
  else
    {
      SetBit(victim->Flags, PLR_SILENCE);
      victim->Echo("You can't use channels!\r\n");
      ch->Echo("SILENCE set.\r\n");
    }
}

