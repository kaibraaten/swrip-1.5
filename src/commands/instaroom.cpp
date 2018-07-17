#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_instaroom( Character *ch, char *argument )
{
  Area *pArea = NULL;
  Room *pRoom = NULL;
  bool dodoors = false;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->PCData
       || !ch->PCData->Build.Area )
    {
      SendToCharacter( "You don't have an assigned area to create resets for.\r\n", ch );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !StrCmp(argument, "nodoors") )
    dodoors = false;
  else
    dodoors = true;

  pArea = ch->PCData->Build.Area;

  if ( !(pRoom = FindRoom(ch, arg, NULL)) )
    {
      SendToCharacter( "Room doesn't exist.\r\n", ch );
      return;
    }

  if ( !CanModifyRoom(ch, pRoom) )
    return;

  if ( pRoom->Area != pArea && GetTrustLevel(ch) < LEVEL_GREATER )
    {
      SendToCharacter( "You cannot reset that room.\r\n", ch );
      return;
    }

  if ( pArea->FirstReset )
    WipeResets(pArea, pRoom);

  InstallRoom(pArea, pRoom, dodoors);
  SendToCharacter( "Room resets installed.\r\n", ch );
}
