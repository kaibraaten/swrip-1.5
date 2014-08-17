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
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      progbug( "Mpgoto - No argument", ch );
      return;
    }

  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      progbug( "Mpgoto - No such location", ch );
      return;
    }

  if ( ch->fighting )
    stop_fighting( ch, true );

  char_from_room( ch );
  char_to_room( ch, location );
}
