#include "character.h"
#include "mud.h"

void do_freeze( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Freeze whom?\r\n", ch );
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

  if ( IsBitSet(victim->act, PLR_FREEZE) )
    {
      RemoveBit(victim->act, PLR_FREEZE);
      SendToCharacter( "You can play again.\r\n", victim );
      SendToCharacter( "FREEZE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_FREEZE);
      SendToCharacter( "You can't do ANYthing!\r\n", victim );
      SendToCharacter( "FREEZE set.\r\n", ch );
    }

  SaveCharacter( victim );
}
