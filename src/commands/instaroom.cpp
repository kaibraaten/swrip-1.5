#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_instaroom( std::shared_ptr<Character> ch, std::string argument )
{
  std::shared_ptr<Room> pRoom;
  bool dodoors = false;
  std::string arg;

  if ( IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->PCData
       || !ch->PCData->Build.Area )
    {
      ch->Echo("You don't have an assigned area to create resets for.\r\n");
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !StrCmp(argument, "nodoors") )
    dodoors = false;
  else
    dodoors = true;

  auto pArea = ch->PCData->Build.Area;

  if ( !(pRoom = FindRoom(ch, arg, NULL)) )
    {
      ch->Echo("Room doesn't exist.\r\n");
      return;
    }

  if ( !CanModifyRoom(ch, pRoom) )
    return;

  if ( pRoom->Area != pArea && GetTrustLevel(ch) < LEVEL_GREATER )
    {
      ch->Echo("You cannot reset that room.\r\n");
      return;
    }

  if ( pArea->FirstReset )
    WipeResets(pArea, pRoom);

  InstallRoom(pArea, pRoom, dodoors, ch->PCData->Build.Plugin.get());
  ch->Echo("Room resets installed.\r\n");
}


