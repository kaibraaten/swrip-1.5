#include "character.hpp"
#include "mud.hpp"

/* prints message to room at large. */

void do_mpecho( Character *ch, char *argument )
{
  char       arg1 [MAX_INPUT_LENGTH];
  short     color;
  int        mobflags;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc(ch) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ProgBug( "Mpecho - called w/o argument", ch );
      return;
    }

  mobflags = ch->Flags;
  RemoveBit(ch->Flags, ACT_SECRETIVE);

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument ( argument, arg1 );
      Act( color, argument, ch, NULL, NULL, TO_ROOM );
    }
  else
    Act( AT_ACTION, argument, ch, NULL, NULL, TO_ROOM );

  ch->Flags = mobflags;
}

