#include "character.h"
#include "mud.h"

void do_litterbug( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Set litterbug flag on whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      SendToCharacter( "You failed.\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->act, PLR_LITTERBUG) )
    {
      RemoveBit(victim->act, PLR_LITTERBUG);
      SendToCharacter( "You can drop items again.\r\n", victim );
      SendToCharacter( "LITTERBUG removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_LITTERBUG);
      SendToCharacter( "You a strange force prevents you from dropping any more items!\r\n", victim );
      SendToCharacter( "LITTERBUG set.\r\n", ch );
    }
}
