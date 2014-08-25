#include "reset.h"
#include "mud.h"
#include "character.h"

void do_rreset( Character *ch, char *argument )
{
  Room *pRoom;

  if ( ch->substate == SUB_REPEATCMD )
    {
      pRoom = (Room*)ch->dest_buf;
      if ( !pRoom )
        {
          SendToCharacter( "Your room pointer got lost.  Reset mode off.\r\n", ch);
          Bug("do_rreset: %s's dest_buf points to invalid room", ch->name);
        }
      ch->substate = SUB_NONE;
      FreeMemory(ch->dest_buf);
      return;
    }
  else
    pRoom = ch->in_room;
  if ( !CanModifyRoom(ch, pRoom) )
    return;
  EditReset(ch, argument, pRoom->area, pRoom);
}
