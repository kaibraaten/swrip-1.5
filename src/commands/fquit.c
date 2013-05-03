#include "mud.h"

/*
 * Force a level one player to quit.             Gorog
 */
void do_fquit( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg1[MAX_INPUT_LENGTH];
  argument = one_argument( argument, arg1 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Force whom to quit?\r\n", ch );
      return;
    }

  if ( !( victim = get_char_world( ch, arg1 ) ) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim->top_level != 1 )
    {
      send_to_char( "They are not level one!\r\n", ch );
      return;
    }

  send_to_char( "The MUD administrators force you to quit\r\n", victim );
  do_quit (victim, "");
  send_to_char( "Ok.\r\n", ch );
}
