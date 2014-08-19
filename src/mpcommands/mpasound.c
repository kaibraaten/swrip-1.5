#include "mud.h"
#include "character.h"

/* Prints the argument to all the rooms around the mobile */
void do_mpasound( Character *ch, char *argument )
{
  Room *was_in_room;
  Exit       *pexit;
  int                actflags;

  if (!ch )
    {
      Bug("Nonexistent ch in do_mpasound!",0);
      return;
    }

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      ProgBug( "Mpasound - No argument", ch );
      return;
    }

  actflags = ch->act;
  RemoveBit(ch->act, ACT_SECRETIVE);
  was_in_room = ch->in_room;
  for ( pexit = was_in_room->first_exit; pexit; pexit = pexit->next )
    {
      if ( pexit->to_room
           &&   pexit->to_room != was_in_room )
        {
          ch->in_room = pexit->to_room;
          MOBtrigger  = false;
          Act( AT_SAY, argument, ch, NULL, NULL, TO_ROOM );
        }
    }
  ch->act = actflags;
  ch->in_room = was_in_room;
}
