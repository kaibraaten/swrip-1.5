#include "reset.h"
#include "mud.h"
#include "character.hpp"

void do_rreset( Character *ch, char *argument )
{
  Room *pRoom;

  if ( ch->SubState == SUB_REPEATCMD )
    {
      pRoom = (Room*)ch->dest_buf;

      if ( !pRoom )
        {
          SendToCharacter( "Your room pointer got lost. Reset mode off.\r\n", ch);
          Bug("do_rreset: %s's dest_buf points to invalid room", ch->Name);
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
