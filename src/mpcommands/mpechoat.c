#include "character.h"
#include "mud.h"

/* prints message only to victim */

void do_mpechoat( Character *ch, char *argument )
{
  char       arg[ MAX_INPUT_LENGTH ];
  Character *victim;
  int        actflags;
  short     color;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      ProgBug( "Mpechoat - No argument", ch );
      return;
    }

  if ( !( victim = GetCharacterInRoomMudProg( ch, arg ) ) )
    {
      ProgBug( "Mpechoat - victim does not exist", ch );
      return;
    }

  actflags = ch->act;
  RemoveBit(ch->act, ACT_SECRETIVE);

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument( argument, arg );
      Act( color, argument, ch, NULL, victim, TO_VICT );
    }
  else
    Act( AT_ACTION, argument, ch, NULL, victim, TO_VICT );

  ch->act = actflags;
}
