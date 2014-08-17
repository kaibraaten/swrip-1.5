#include "character.h"
#include "mud.h"

/* prints message to room at large. */

void do_mpecho( Character *ch, char *argument )
{
  char       arg1 [MAX_INPUT_LENGTH];
  short     color;
  int        actflags;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc(ch) )
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
  RemoveBit(ch->act, ACT_SECRETIVE);

  if ( (color = get_color(argument)) )
    {
      argument = OneArgument ( argument, arg1 );
      act( color, argument, ch, NULL, NULL, TO_ROOM );
    }
  else
    act( AT_ACTION, argument, ch, NULL, NULL, TO_ROOM );

  ch->act = actflags;
}
