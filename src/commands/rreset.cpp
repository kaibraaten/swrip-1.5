#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"

void do_rreset( Character *ch, char *argument )
{
  Room *pRoom;

  if ( ch->SubState == SUB_REPEATCMD )
    {
      pRoom = (Room*)ch->dest_buf;

      if ( !pRoom )
        {
          ch->Echo("Your room pointer got lost. Reset mode off.\r\n");
          Log->Bug("do_rreset: %s's dest_buf points to invalid room", ch->Name);
        }

      ch->SubState = SUB_NONE;
      FreeMemory(ch->dest_buf);
      return;
    }
  else
    {
      pRoom = ch->InRoom;
    }
  
  if ( !CanModifyRoom(ch, pRoom) )
    return;

  EditReset(ch, argument, pRoom->Area, pRoom);
}

