#include "mud.h"
#include "character.h"

void do_notell( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Notell whom?", ch );
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

  if ( IsBitSet(victim->Flags, PLR_NO_TELL) )
    {
      RemoveBit(victim->Flags, PLR_NO_TELL);
      SendToCharacter( "You can tell again.\r\n", victim );
      SendToCharacter( "NO_TELL removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->Flags, PLR_NO_TELL);
      SendToCharacter( "You can't tell!\r\n", victim );
      SendToCharacter( "NO_TELL set.\r\n", ch );
    }
}
