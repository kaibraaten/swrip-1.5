#include "character.h"
#include "reset.h"
#include "mud.h"

void do_instazone( Character *ch, char *argument )
{
  Area *pArea;
  int vnum;
  ROOM_INDEX_DATA *pRoom;
  bool dodoors;

  if ( is_npc(ch) || get_trust(ch) < LEVEL_CREATOR || !ch->pcdata ||
       !ch->pcdata->area )
    {
      send_to_char( "You don't have an assigned area to create resets for.\r\n",
                    ch );
      return;
    }
  if ( !str_cmp(argument, "nodoors") )
    dodoors = FALSE;
  else
    dodoors = TRUE;
  pArea = ch->pcdata->area;
  if ( pArea->first_reset )
    wipe_resets(pArea, NULL);
  for ( vnum = pArea->low_r_vnum; vnum <= pArea->hi_r_vnum; vnum++ )
    {
      if ( !(pRoom = get_room_index(vnum)) || pRoom->area != pArea )
        continue;
      instaroom( pArea, pRoom, dodoors );
    }
  send_to_char( "Area resets installed.\r\n", ch );
}
