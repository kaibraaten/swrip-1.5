#include "mud.h"
#include "character.h"

void do_unsilence( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Unsilence whom?\r\n", ch );
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

  if ( IsBitSet(victim->act, PLR_SILENCE) )
    {
      RemoveBit(victim->act, PLR_SILENCE);
      SendToCharacter( "You can use channels again.\r\n", victim );
      SendToCharacter( "SILENCE removed.\r\n", ch );
    }
  else
    {
      SendToCharacter( "That player is not silenced.\r\n", ch );
    }
}
