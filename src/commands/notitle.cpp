#include "mud.h"
#include "character.hpp"

void do_notitle( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Notitle whom?\r\n", ch );
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

  if ( IsBitSet(victim->PCData->Flags, PCFLAG_NOTITLE) )
    {
      RemoveBit(victim->PCData->Flags, PCFLAG_NOTITLE);
      SendToCharacter( "You can set your own title again.\r\n", victim );
      SendToCharacter( "NOTITLE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->PCData->Flags, PCFLAG_NOTITLE);
      sprintf( buf, "%s", victim->Name );
      SetCharacterTitle( victim, buf );
      SendToCharacter( "You can't set your own title!\r\n", victim );
      SendToCharacter( "NOTITLE set.\r\n", ch );
    }
}
