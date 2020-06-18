#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "home.hpp"
#include "repos/arearepository.hpp"
#include "repos/homerepository.hpp"

void do_sellhome(std::shared_ptr<Character> ch, std::string argument)
{
    constexpr auto sellHomeCreditReturn = 50000;
    std::shared_ptr<Room> room = ch->InRoom;
    auto home = Homes->FindByVnum(room->Vnum);

    if (home == nullptr)
    {
        ch->Echo("&RYou need to be inside your home to sell it.\r\n");
        return;
    }

    if (StrCmp(home->Owner(), ch->Name) != 0)
    {
        ch->Echo("&RYou are not the owner of this home.\r\n");
        return;
    }

    Homes->Delete(home);
    
    ch->Gold += sellHomeCreditReturn;
    do_save(ch, "");
    ch->Echo("You sell your home. You receive %d credits.\r\n", sellHomeCreditReturn);
}
