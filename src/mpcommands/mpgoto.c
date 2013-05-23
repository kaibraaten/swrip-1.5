#include "mud.h"
#include "character.h"

/* lets the mobile goto any location it wishes that is not private */

void do_mpgoto( CHAR_DATA *ch, char *argument )
{
  char arg[ MAX_INPUT_LENGTH ];
  ROOM_INDEX_DATA *location;

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !is_npc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  one_argument( argument, arg );
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
    stop_fighting( ch, TRUE );

  char_from_room( ch );
  char_to_room( ch, location );
}
