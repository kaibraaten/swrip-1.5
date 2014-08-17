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
      send_to_char( "Bestow whom with what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) )
    {
      send_to_char( "You can't give special abilities to a mob!\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) > GetTrustLevel( ch ) )
    {
      send_to_char( "You aren't powerful enough...\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = CopyString("");

  if ( argument[0] == '\0' || !StrCmp( argument, "list" ) )
    {
      ch_printf( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->name, victim->pcdata->bestowments );
      return;
    }

  if ( !StrCmp( argument, "none" ) )
    {
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString("");
      ch_printf( ch, "Bestowments removed from %s.\r\n", victim->name );
      ch_printf( victim, "%s has removed your bestowed commands.\r\n", ch->name );
      return;
    }

  sprintf( buf, "%s %s", victim->pcdata->bestowments, argument );
  DISPOSE( victim->pcdata->bestowments );
  victim->pcdata->bestowments = CopyString( buf );
  ch_printf( victim, "%s has bestowed on you the command(s): %s\r\n",
             ch->name, argument );
  send_to_char( "Done.\r\n", ch );
}
