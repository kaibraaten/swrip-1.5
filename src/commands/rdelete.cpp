#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_rdelete( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Delete which room?\r\n");
      return;
    }

  /* Find the room. */
  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      ch->Echo("No such location.\r\n");
      return;
    }

  /* Does the player have the right to delete this room? */
  if ( GetTrustLevel( ch ) < SysData.LevelToModifyProto
       && ( location->Vnum < ch->PCData->Build.VnumRanges.Room.First
	    || location->Vnum > ch->PCData->Build.VnumRanges.Room.Last ) )
    {
      ch->Echo("That room is not in your assigned range.\r\n");
      return;
    }

  /* We could go to the trouble of clearing out the room, but why? */
  if ( location->FirstPerson || location->FirstContent )
    {
      ch->Echo("The room must be empty first.\r\n");
      return;
    }

  /* Ok, we've determined that the room exists, it is empty and the
     player has the authority to delete it, so let's dump the thing.
     The function to do it is in db.c so it can access the top-room
     variable. */
  DeleteRoom( location );

  ch->Echo("Room deleted.\r\n");
}

