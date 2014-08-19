#include "character.h"
#include "mud.h"

void do_bestow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim;

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Bestow whom with what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
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

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = CopyString("");

  if ( argument[0] == '\0' || !StrCmp( argument, "list" ) )
    {
      ChPrintf( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->name, victim->pcdata->bestowments );
      return;
    }

  if ( !StrCmp( argument, "none" ) )
    {
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString("");
      ChPrintf( ch, "Bestowments removed from %s.\r\n", victim->name );
      ChPrintf( victim, "%s has removed your bestowed commands.\r\n", ch->name );
      return;
    }

  sprintf( buf, "%s %s", victim->pcdata->bestowments, argument );
  FreeMemory( victim->pcdata->bestowments );
  victim->pcdata->bestowments = CopyString( buf );
  ChPrintf( victim, "%s has bestowed on you the command(s): %s\r\n",
             ch->name, argument );
  SendToCharacter( "Done.\r\n", ch );
}
