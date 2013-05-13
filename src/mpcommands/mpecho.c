#include "mud.h"

/* prints message to room at large. */

void do_mpecho( CHAR_DATA *ch, char *argument )
{
  char       arg1 [MAX_INPUT_LENGTH];
  short     color;
  int        actflags;

  if ( IS_AFFECTED( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC(ch) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      progbug( "Mpecho - called w/o argument", ch );
      return;
    }

  actflags = ch->act;
  REMOVE_BIT(ch->act, ACT_SECRETIVE);

  if ( (color = get_color(argument)) )
    {
      argument = one_argument ( argument, arg1 );
      act( color, argument, ch, NULL, NULL, TO_ROOM );
    }
  else
    act( AT_ACTION, argument, ch, NULL, NULL, TO_ROOM );

  ch->act = actflags;
}
