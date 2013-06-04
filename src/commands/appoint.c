#include "character.h"
#include "mud.h"
#include "clan.h"

void do_appoint ( CHAR_DATA *ch , char *argument )
{
  char arg[MAX_STRING_LENGTH];

  argument = one_argument( argument, arg );

  if ( is_npc( ch ) || !ch->pcdata )
    return;

  if ( !is_clanned( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( str_cmp( ch->name, ch->pcdata->clan->leadership.leader ) )
    {
      send_to_char( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: appoint <name> < first | second >\r\n", ch );
      return;
    }

  if ( !str_cmp( argument , "first" )  )
    {
      if ( ch->pcdata->clan->leadership.number1 && str_cmp( ch->pcdata->clan->leadership.number1 , "" ) )
        {
          send_to_char( "You already have someone in that position... demote them first.\r\n", ch);
          return;
        }

      STRFREE( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = STRALLOC( arg );
    }
  else if ( !str_cmp( argument , "second" )  )
    {
      if ( ch->pcdata->clan->leadership.number2 && str_cmp( ch->pcdata->clan->leadership.number2 , "" ))
        {
          send_to_char( "You already have someone in that position... demote them first.\r\n", ch);
          return;
        }

      STRFREE( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = STRALLOC( arg );
    }
  else
    do_appoint( ch , "" );

  save_clan ( ch->pcdata->clan );
}
