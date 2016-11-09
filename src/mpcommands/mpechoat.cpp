#include "character.hpp"
#include "mud.h"

/* prints message only to victim */

void do_mpechoat( Character *ch, char *argument )
{
  char arg[ MAX_INPUT_LENGTH ];
  Character *victim;
  int mobflags;
  short color;

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

  mobflags = ch->Flags;
  RemoveBit(ch->Flags, ACT_SECRETIVE);

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument( argument, arg );
      Act( color, argument, ch, NULL, victim, TO_VICT );
    }
  else
    Act( AT_ACTION, argument, ch, NULL, victim, TO_VICT );

  ch->Flags = mobflags;
}
