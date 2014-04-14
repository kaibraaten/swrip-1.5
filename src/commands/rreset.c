#include "reset.h"
#include "mud.h"
#include "character.h"

void do_rreset( Character *ch, char *argument )
{
  ROOM_INDEX_DATA *pRoom = NULL;

  if ( ch->substate == SUB_REPEATCMD )
    {
      pRoom = (ROOM_INDEX_DATA*)ch->dest_buf;

      if ( !pRoom )
        {
          send_to_char( "Your room pointer got lost.  Reset mode off.\r\n", ch);
          bug("do_rreset: %s's dest_buf points to invalid room", ch->name);
        }

      ch->substate = SUB_NONE;
      DISPOSE(ch->dest_buf);
      return;
    }
  else
    pRoom = ch->in_room;

  if ( !can_rmodify(ch, pRoom) )
    return;

  edit_reset(ch, argument, pRoom->area, pRoom);
}
