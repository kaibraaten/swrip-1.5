#include "mud.h"

void do_retran( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  char buf[MAX_STRING_LENGTH];

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char("Retransfer whom?\r\n", ch );
      return;
    }

  if ( !(victim = get_char_world(ch, arg)) )
    {
      send_to_char("They aren't here.\r\n", ch );
      return;
    }

  sprintf(buf, "'%s' %d", victim->name, victim->retran);
  do_transfer(ch, buf);
}
