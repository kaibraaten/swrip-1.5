#include "mud.h"
#include "character.h"

void do_noemote( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Noemote whom?\r\n", ch );
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

  if ( IsBitSet(victim->act, PLR_NO_EMOTE) )
    {
      RemoveBit(victim->act, PLR_NO_EMOTE);
      SendToCharacter( "You can emote again.\r\n", victim );
      SendToCharacter( "NO_EMOTE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_NO_EMOTE);
      SendToCharacter( "You can't emote!\r\n", victim );
      SendToCharacter( "NO_EMOTE set.\r\n", ch );
    }
}
