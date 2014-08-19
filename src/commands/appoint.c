#include "character.h"
#include "mud.h"

void do_appoint ( Character *ch , char *argument )
{
  char arg[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNpc( ch ) || !ch->pcdata )
    return;

  if ( !ch->pcdata->clan )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if (  StrCmp( ch->name, ch->pcdata->clan->leadership.leader  )  )
    {
      SendToCharacter( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Usage: appoint <name> < first | second >\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , "first" )  )
    {
      if ( ch->pcdata->clan->leadership.number1 && StrCmp( ch->pcdata->clan->leadership.number1 , "" ) )
        {
          SendToCharacter( "You already have someone in that position... demote them first.\r\n", ch);
          return;
        }

      FreeMemory( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = CopyString( arg );
    }
  else if ( !StrCmp( argument , "second" )  )
    {
      if ( ch->pcdata->clan->leadership.number2 && StrCmp( ch->pcdata->clan->leadership.number2 , "" ))
        {
          SendToCharacter( "You already have someone in that position... demote them first.\r\n", ch);
          return;
        }

      FreeMemory( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = CopyString( arg );
    }
  else
    do_appoint( ch , "" );

  SaveClan ( ch->pcdata->clan );
}
