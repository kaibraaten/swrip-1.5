#include "character.h"
#include "reset.h"
#include "mud.h"

void do_instazone( Character *ch, char *argument )
{
  Area *pArea;
  int vnum;
  Room *pRoom;
  bool dodoors;

  if ( IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->pcdata ||
       !ch->pcdata->area )
    {
      SendToCharacter( "You don't have an assigned area to create resets for.\r\n",
                    ch );
      return;
    }
  if ( !StrCmp(argument, "nodoors") )
    dodoors = false;
  else
    dodoors = true;
  pArea = ch->pcdata->area;
  if ( pArea->first_reset )
    WipeResets(pArea, NULL);
  for ( vnum = pArea->low_r_vnum; vnum <= pArea->hi_r_vnum; vnum++ )
    {
      if ( !(pRoom = GetRoom(vnum)) || pRoom->area != pArea )
        continue;
      InstallRoom( pArea, pRoom, dodoors );
    }
  SendToCharacter( "Area resets installed.\r\n", ch );
}
