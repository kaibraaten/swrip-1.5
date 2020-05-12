#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "repos/arearepository.hpp"

void do_buyhome(Character *ch, std::string argument)
{
    constexpr auto houseCost = 100000;

    if (IsNpc(ch) || !ch->PCData)
        return;

    if (ch->PlayerHome != NULL)
    {
        ch->Echo("&RYou already have a home!\r\n&w");
        return;
    }

    auto room = ch->InRoom;

    for (auto pArea : Areas->AreasInProgress())
    {
        if (room->Area == pArea)
        {
            ch->Echo("&RThis area isn't installed yet!\r\n&d");
            return;
        }
    }

    if (!room->Flags.test(Flag::Room::EmptyHome))
    {
        ch->Echo("&RThis room isn't for sale!\r\n&d");
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

    room->Name = argument;

    ch->Gold -= houseCost;

    room->Flags.reset(Flag::Room::EmptyHome);
    room->Flags.set(Flag::Room::PlayerHome);

    Areas->Save(room->Area);

    ch->PlayerHome = room;
    do_save(ch, "");
}

