#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "home.hpp"
#include "repos/arearepository.hpp"
#include "repos/homerepository.hpp"

void do_buyhome(Character *ch, std::string argument)
{
    constexpr auto houseCost = 100000;

    if (IsNpc(ch) || !ch->PCData)
        return;

    if (!Homes->FindHomesForResident(ch->Name).empty())
    {
        ch->Echo("&RYou already have a home!\r\n&w");
        return;
    }

    auto room = ch->InRoom;

    if(Contains(Areas->AreasInProgress(), room->Area))
    {
        ch->Echo("&RThis area isn't installed yet!\r\n&d");
        return;
    }

    if (!room->Flags.test(Flag::Room::PlayerHome))
    {
        ch->Echo("&RThis room isn't for sale!\r\n&d");
        return;
    }

    if(Homes->FindByVnum(room->Vnum) != nullptr)
    {
        ch->Echo("&RThis home is already owned.\r\n&d");
        return;
    }
    
    if (ch->Gold < houseCost)
    {
        ch->Echo("&RThis room costs %d credits you don't have enough!\r\n&d", houseCost);
        return;
    }

    if (argument.empty())
    {
        ch->Echo("Set the room name. A very brief single line room description.\r\n");
        ch->Echo("Usage: Buyhome <Room Name>\r\n");
        return;
    }

    auto home = std::make_shared<Home>(room->Vnum);
    home->RoomName(argument);
    auto resident = std::make_shared<Resident>();
    resident->Name = ch->Name;
    resident->GiveAllPermissions();
    home->Add(resident);
    Homes->Add(home);
    Homes->Save(home);
    
    ch->Gold -= houseCost;

    do_save(ch, "");
}

