#include "character.h"
#include "mud.h"

void do_rdelete( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Delete which room?\r\n", ch );
      return;
    }

  /* Find the room. */
  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      SendToCharacter( "No such location.\r\n", ch );
      return;
    }

  /* Does the player have the right to delete this room? */
  if ( GetTrustLevel( ch ) < SysData.LevelToModifyProto
       && ( location->Vnum < ch->PCData->Build.RoomRange.Low
	    || location->Vnum > ch->PCData->Build.RoomRange.High ) )
    {
      SendToCharacter( "That room is not in your assigned range.\r\n", ch );
      return;
    }

  /* We could go to the trouble of clearing out the room, but why? */
  if ( location->FirstPerson || location->FirstContent )
    {
      SendToCharacter( "The room must be empty first.\r\n", ch );
      return;
    }

  /* Ok, we've determined that the room exists, it is empty and the
     player has the authority to delete it, so let's dump the thing.
     The function to do it is in db.c so it can access the top-room
     variable. */
  DeleteRoom( location );

  SendToCharacter( "Room deleted.\r\n", ch );
}
