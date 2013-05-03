#include "mud.h"

void do_unsilence( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Unsilence whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_SILENCE) )
    {
      REMOVE_BIT(victim->act, PLR_SILENCE);
      send_to_char( "You can use channels again.\r\n", victim );
      send_to_char( "SILENCE removed.\r\n", ch );
    }
  else
    {
      send_to_char( "That player is not silenced.\r\n", ch );
    }
}
