#include "character.h"
#include "mud.h"

void do_demote ( Character *ch , char *argument )
{

  if ( IsNpc( ch ) || !ch->pcdata )
    return;

  if ( !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if (  StrCmp( ch->name, ch->pcdata->clan->leadership.leader  )  )
    {
      send_to_char( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Demote who?\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , ch->pcdata->clan->leadership.number1 )  )
    {
      send_to_char( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = CopyString( "" );
    }
  else if ( !StrCmp( argument , ch->pcdata->clan->leadership.number2 )  )
    {
      send_to_char( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = CopyString( "" );
    }
  else
    {
      send_to_char( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  save_clan ( ch->pcdata->clan );
}
