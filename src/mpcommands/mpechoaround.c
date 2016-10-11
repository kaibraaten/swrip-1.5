#include "character.h"
#include "mud.h"

/* prints the message to everyone in the room other than the mob and victim */

void do_mpechoaround( Character *ch, char *argument )
{
  char       arg[ MAX_INPUT_LENGTH ];
  Character *victim;
  int        mobflags;
  short     color;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ProgBug( "Mpechoaround - No argument", ch );
      return;
    }

  if ( !( victim=GetCharacterInRoomMudProg( ch, arg ) ) )
    {
      ProgBug( "Mpechoaround - victim does not exist", ch );
      return;
    }

  mobflags = ch->Flags;
  RemoveBit(ch->Flags, ACT_SECRETIVE);

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument( argument, arg );
      Act( color, argument, ch, NULL, victim, TO_NOTVICT );
    }
  else
    Act( AT_ACTION, argument, ch, NULL, victim, TO_NOTVICT );

  ch->Flags = mobflags;
}
