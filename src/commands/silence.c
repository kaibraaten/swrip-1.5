#include "character.h"
#include "mud.h"

void do_silence( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Silence whom?", ch );
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
      SendToCharacter( "Player already silenced, use unsilence to remove.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_SILENCE);
      SendToCharacter( "You can't use channels!\r\n", victim );
      SendToCharacter( "SILENCE set.\r\n", ch );
    }
}
