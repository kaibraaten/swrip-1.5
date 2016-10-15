#include "mud.h"
#include "character.h"

/* Prints the argument to all the rooms around the mobile */
void do_mpasound( Character *ch, char *argument )
{
  Room *was_in_room;
  Exit *pexit;
  int mobflags;

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

  if ( IsNullOrEmpty( argument ) )
    {
      ProgBug( "Mpasound - No argument", ch );
      return;
    }

  mobflags = ch->Flags;
  RemoveBit(ch->Flags, ACT_SECRETIVE);
  was_in_room = ch->InRoom;

  for ( pexit = was_in_room->FirstExit; pexit; pexit = pexit->Next )
    {
      if ( pexit->to_room
           &&   pexit->to_room != was_in_room )
        {
          ch->InRoom = pexit->to_room;
          MOBtrigger  = false;
          Act( AT_SAY, argument, ch, NULL, NULL, TO_ROOM );
        }
    }
  
  ch->Flags = mobflags;
  ch->InRoom = was_in_room;
}
