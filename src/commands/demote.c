#include "mud.h"

void do_demote ( CHAR_DATA *ch , char *argument )
{

  if ( IS_NPC( ch ) || !ch->pcdata )
    return;

  if ( !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if (  str_cmp( ch->name, ch->pcdata->clan->leader  )  )
    {
      send_to_char( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Demote who?\r\n", ch );
      return;
    }

  if ( !str_cmp( argument , ch->pcdata->clan->number1 )  )
    {
      send_to_char( "Player Demoted!", ch );

      STRFREE( ch->pcdata->clan->number1 );
      ch->pcdata->clan->number1 = STRALLOC( "" );
    }
  else if ( !str_cmp( argument , ch->pcdata->clan->number2 )  )
    {
      send_to_char( "Player Demoted!", ch );

      STRFREE( ch->pcdata->clan->number2 );
      ch->pcdata->clan->number2 = STRALLOC( "" );
    }
  else
    {
      send_to_char( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  save_clan ( ch->pcdata->clan );
}