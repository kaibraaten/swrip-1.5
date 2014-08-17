#include "mud.h"
#include "character.h"

void do_trust( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;
  int level;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || !IsNumber( arg2 ) )
    {
      send_to_char( "Syntax: trust <char> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 0 || level > MAX_LEVEL )
    {
      send_to_char( "Level must be 0 (reset) or 1 to 60.\r\n", ch );
      return;
    }

  if ( level > GetTrustLevel( ch ) )
    {
      send_to_char( "Limited to your own trust.\r\n", ch );
      return;
    }

  if ( ch->top_level < LEVEL_IMPLEMENTOR && GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  victim->trust = level;
  send_to_char( "Ok.\r\n", ch );
}
