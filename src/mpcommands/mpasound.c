#include "mud.h"

/* Prints the argument to all the rooms around the mobile */
void do_mpasound( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *was_in_room;
  EXIT_DATA       *pexit;
  int                actflags;

  if (!ch )
    {
      bug("Nonexistent ch in do_mpasound!",0);
      return;
    }

  if ( IS_AFFECTED( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      progbug( "Mpasound - No argument", ch );
      return;
    }

  actflags = ch->act;
  REMOVE_BIT(ch->act, ACT_SECRETIVE);
  was_in_room = ch->in_room;
  for ( pexit = was_in_room->first_exit; pexit; pexit = pexit->next )
    {
      if ( pexit->to_room
           &&   pexit->to_room != was_in_room )
        {
          ch->in_room = pexit->to_room;
          MOBtrigger  = FALSE;
          act( AT_SAY, argument, ch, NULL, NULL, TO_ROOM );
        }
    }
  ch->act = actflags;
  ch->in_room = was_in_room;
}
