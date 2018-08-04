#include <cassert>
#include "mud.hpp"
#include "character.hpp"

/* Prints the argument to all the rooms around the mobile */
void do_mpasound( Character *ch, char *argument )
{
  Room *was_in_room = nullptr;
  Exit *pexit = nullptr;
  int mobflags = 0;

  assert(ch != nullptr);

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
      if ( pexit->ToRoom
           &&   pexit->ToRoom != was_in_room )
        {
          ch->InRoom = pexit->ToRoom;
          MOBtrigger  = false;
          Act( AT_SAY, argument, ch, NULL, NULL, TO_ROOM );
        }
    }
  
  ch->Flags = mobflags;
  ch->InRoom = was_in_room;
}
