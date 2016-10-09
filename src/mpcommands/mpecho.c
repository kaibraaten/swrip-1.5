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
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ProgBug( "Mpecho - called w/o argument", ch );
      return;
    }

  actflags = ch->act;
  RemoveBit(ch->act, ACT_SECRETIVE);

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument ( argument, arg1 );
      Act( color, argument, ch, NULL, NULL, TO_ROOM );
    }
  else
    Act( AT_ACTION, argument, ch, NULL, NULL, TO_ROOM );

  ch->act = actflags;
}
