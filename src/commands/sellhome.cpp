#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "repos/arearepository.hpp"

void do_sellhome(Character *ch, std::string argument)
{
    constexpr auto sellHomeCreditReturn = 50000;
    std::shared_ptr<Room> room;

    if (ch->PlayerHome == NULL)
    {
        ch->Echo("&RYou don't own a home.\r\n");
        return;
    }

    if ((room = ch->InRoom) != ch->PlayerHome)
    {
        ch->Echo("&RYou need to be inside your home to sell it.\r\n");
        return;
    }

    if (IsBitSet(ch->Flags, PLR_HOME_RESIDENT))
    {
        ch->Echo("&RYou are not the owner of this home.\r\n");
        return;
    }

    room->Name = "An Empty Apartment";
    ch->Gold += sellHomeCreditReturn;
    room->Flags.reset(Flag::Room::PlayerHome);
    room->Flags.set(Flag::Room::EmptyHome);
    Areas->Save(room->Area);
    ch->PlayerHome = NULL;
    do_save(ch, "");
    ch->Echo("You sell your home. You receive %d credits.\r\n", sellHomeCreditReturn);
}
