#include "mud.hpp"
#include "room.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "area.hpp"
#include "plugins.hpp"

void do_rcreate(std::shared_ptr<Character> ch, std::string argument)
{
    auto area = ch->PCData->Build.Area;
    auto plugin = ch->PCData->Build.Plugin;
    
    if(area == nullptr)
    {
        ch->Echo("&RYou must have an assigned area to create rooms.&d\r\n");
        return;
    }

    vnum_t vnum = INVALID_VNUM;
    
    if(IsNumber(argument))
    {
        vnum = ToLong(argument);
    }
    else if(StrCmp(argument, "auto") == 0)
    {
        vnum = GetFreeRoomVnum(area);
    }

    if(!RoomVnumIsInArea(vnum, area))
    {
        ch->Echo("&RYou must provide a free vnum within your assigned area's range, or AUTO.&d\r\n");
        return;
    }

    if(FindLocation(ch, std::to_string(vnum)))
    {
        ch->Echo("&RA room with that vnum already exists.&d\r\n");
        return;
    }

    auto newRoom = MakeRoom(vnum);
    newRoom->Area = area;

    if(plugin != nullptr)
    {
        plugin->Add(newRoom);
    }

    do_goto(ch, std::to_string(vnum));
}
