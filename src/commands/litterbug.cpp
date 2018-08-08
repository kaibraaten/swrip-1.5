#include "character.hpp"
#include "mud.hpp"

void do_litterbug( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Set litterbug flag on whom?\r\n");
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

  if ( IsBitSet(victim->Flags, PLR_LITTERBUG) )
    {
      RemoveBit(victim->Flags, PLR_LITTERBUG);
      victim->Echo("You can drop items again.\r\n");
      ch->Echo("LITTERBUG removed.\r\n");
    }
  else
    {
      SetBit(victim->Flags, PLR_LITTERBUG);
      victim->Echo("You a strange force prevents you from dropping any more items!\r\n");
      ch->Echo("LITTERBUG set.\r\n");
    }
}


