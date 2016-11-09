#include "mud.hpp"
#include "character.hpp"

void do_noemote( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
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

  if ( IsBitSet(victim->Flags, PLR_NO_EMOTE) )
    {
      RemoveBit(victim->Flags, PLR_NO_EMOTE);
      SendToCharacter( "You can emote again.\r\n", victim );
      SendToCharacter( "NO_EMOTE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->Flags, PLR_NO_EMOTE);
      SendToCharacter( "You can't emote!\r\n", victim );
      SendToCharacter( "NO_EMOTE set.\r\n", ch );
    }
}
