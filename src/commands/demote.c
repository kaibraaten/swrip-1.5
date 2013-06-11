#include "character.h"
#include "mud.h"
#include "clan.h"

void do_demote ( Character *ch , char *argument )
{
  if ( IsNpc( ch ) )
    return;

  if ( !is_clanned( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if (  str_cmp( ch->name, ch->pcdata->clan->leadership.leader  )  )
    {
      send_to_char( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Demote who?\r\n", ch );
      return;
    }

  if ( !str_cmp( argument , ch->pcdata->clan->leadership.number1 )  )
    {
      send_to_char( "Player Demoted!", ch );

      STRFREE( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = STRALLOC( "" );
    }
  else if ( !str_cmp( argument , ch->pcdata->clan->leadership.number2 )  )
    {
      send_to_char( "Player Demoted!", ch );

      STRFREE( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = STRALLOC( "" );
    }
  else
    {
      send_to_char( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  SaveClan( ch->pcdata->clan );
}
