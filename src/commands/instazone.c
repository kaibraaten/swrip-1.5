#include "character.hpp"
#include "reset.h"
#include "mud.h"
#include "area.h"

void do_instazone( Character *ch, char *argument )
{
  Area *pArea;
  int vnum;
  Room *pRoom;
  bool dodoors;

  if ( IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->PCData ||
       !ch->PCData->Build.Area )
    {
      SendToCharacter( "You don't have an assigned area to create resets for.\r\n",
                    ch );
      return;
    }
  if ( !StrCmp(argument, "nodoors") )
    dodoors = false;
  else
    dodoors = true;
  pArea = ch->PCData->Build.Area;
  if ( pArea->FirstReset )
    WipeResets(pArea, NULL);
  for ( vnum = pArea->VnumRanges.Room.First; vnum <= pArea->VnumRanges.Room.Last; vnum++ )
    {
      if ( !(pRoom = GetRoom(vnum)) || pRoom->Area != pArea )
        continue;
      InstallRoom( pArea, pRoom, dodoors );
    }
  SendToCharacter( "Area resets installed.\r\n", ch );
}
