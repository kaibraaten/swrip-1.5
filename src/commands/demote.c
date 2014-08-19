#include "character.h"
#include "mud.h"

void do_demote ( Character *ch , char *argument )
{

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
      SendToCharacter( "Demote who?\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , ch->pcdata->clan->leadership.number1 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = CopyString( "" );
    }
  else if ( !StrCmp( argument , ch->pcdata->clan->leadership.number2 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = CopyString( "" );
    }
  else
    {
      SendToCharacter( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  SaveClan ( ch->pcdata->clan );
}
