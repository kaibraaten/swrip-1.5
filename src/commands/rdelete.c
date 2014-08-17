#include "character.h"
#include "mud.h"

void do_rdelete( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Delete which room?\r\n", ch );
      return;
    }

  /* Find the room. */
  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  /* Does the player have the right to delete this room? */
  if ( GetTrustLevel( ch ) < sysdata.level_modify_proto
       && ( location->vnum < ch->pcdata->r_range_lo
	    || location->vnum > ch->pcdata->r_range_hi ) )
    {
      send_to_char( "That room is not in your assigned range.\r\n", ch );
      return;
    }

  /* We could go to the trouble of clearing out the room, but why? */
  if ( location->first_person || location->first_content )
    {
      send_to_char( "The room must be empty first.\r\n", ch );
      return;
    }

  /* Ok, we've determined that the room exists, it is empty and the
     player has the authority to delete it, so let's dump the thing.
     The function to do it is in db.c so it can access the top-room
     variable. */
  delete_room( location );

  send_to_char( "Room deleted.\r\n", ch );
}
