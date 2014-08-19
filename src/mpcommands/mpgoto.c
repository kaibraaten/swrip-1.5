#include "mud.h"
#include "character.h"

/* lets the mobile goto any location it wishes that is not private */

void do_mpgoto( Character *ch, char *argument )
{
  char arg[ MAX_INPUT_LENGTH ];
  Room *location;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      ProgBug( "Mpgoto - No argument", ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      ProgBug( "Mpgoto - No such location", ch );
      return;
    }

  if ( ch->fighting )
    StopFighting( ch, true );

  CharacterFromRoom( ch );
  CharacterToRoom( ch, location );
}
