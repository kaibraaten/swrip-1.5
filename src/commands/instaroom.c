#include "reset.h"
#include "mud.h"
#include "character.h"

void do_instaroom( Character *ch, char *argument )
{
  Area *pArea;
  ROOM_INDEX_DATA *pRoom;
  bool dodoors;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->pcdata ||
       !ch->pcdata->area )
    {
      send_to_char( "You don't have an assigned area to create resets for.\r\n",
                    ch );
      return;
    }
  argument = one_argument(argument, arg);
  if ( !str_cmp(argument, "nodoors") )
    dodoors = false;
  else
    dodoors = true;
  pArea = ch->pcdata->area;
  if ( !(pRoom = find_room(ch, arg, NULL)) )
    {
      send_to_char( "Room doesn't exist.\r\n", ch );
      return;
    }
  if ( !can_rmodify(ch, pRoom) )
    return;
  if ( pRoom->area != pArea && GetTrustLevel(ch) < LEVEL_GREATER )
    {
      send_to_char( "You cannot reset that room.\r\n", ch );
      return;
    }
  if ( pArea->first_reset )
    wipe_resets(pArea, pRoom);
  instaroom(pArea, pRoom, dodoors);
  send_to_char( "Room resets installed.\r\n", ch );
}
