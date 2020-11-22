#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"
#include "pcdata.hpp"

void do_rreset(std::shared_ptr<Character> ch, std::string argument)
{
    auto pRoom = ch->InRoom;

    if (!CanModifyRoom(ch, pRoom))
        return;

    EditReset(ch, argument, pRoom->Area, pRoom, ch->PCData->Build.Plugin.get());
}
