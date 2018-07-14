#include "character.hpp"
#include "mud.hpp"

void do_bestow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Bestow whom with what?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) )
    {
      SendToCharacter( "You can't give special abilities to a mob!\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) > GetTrustLevel( ch ) )
    {
      SendToCharacter( "You aren't powerful enough...\r\n", ch );
      return;
    }

  if (!victim->PCData->Bestowments)
    victim->PCData->Bestowments = CopyString("");

  if ( IsNullOrEmpty( argument ) || !StrCmp( argument, "list" ) )
    {
      Echo( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->Name, victim->PCData->Bestowments );
      return;
    }

  if ( !StrCmp( argument, "none" ) )
    {
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString("");
      Echo( ch, "Bestowments removed from %s.\r\n", victim->Name );
      Echo( victim, "%s has removed your bestowed commands.\r\n", ch->Name );
      return;
    }

  sprintf( buf, "%s %s", victim->PCData->Bestowments, argument );
  FreeMemory( victim->PCData->Bestowments );
  victim->PCData->Bestowments = CopyString( buf );
  Echo( victim, "%s has bestowed on you the command(s): %s\r\n",
             ch->Name, argument );
  SendToCharacter( "Done.\r\n", ch );
}
