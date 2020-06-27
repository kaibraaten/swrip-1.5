#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

void do_recall(std::shared_ptr<Character> ch, std::string argument)
{
    auto location = GetRoom(WhereHome(ch));
    std::shared_ptr<Character> opponent;

    if(GetTrustLevel(ch) < LEVEL_IMMORTAL)
    {
        std::shared_ptr<Area> pArea;

        if(!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("Only builders can recall.\r\n");
            return;
        }

        if(ch->InRoom->Vnum < pArea->VnumRanges.Room.First
           || ch->InRoom->Vnum > pArea->VnumRanges.Room.Last)
        {
            ch->Echo("You can only recall from your assigned area.\r\n");
            return;
        }
    }

    if(!location)
    {
        ch->Echo("You are completely lost.\r\n");
        return;
    }

    if(ch->InRoom == location)
    {
        return;
    }

    if(IsAffectedBy(ch, Flag::Affect::Curse))
    {
        ch->Echo("You are cursed and cannot recall!\r\n");
        return;
    }

    if((opponent = WhoFighting(ch)) != NULL)
    {
        if(NumberBits(1) == 0 || (!IsNpc(opponent) && NumberBits(3) > 1))
        {
            SetWaitState(ch, 4);
            ch->Echo("You failed!\r\n");
            return;
        }

        ch->Echo("You recall from combat!\r\n");
        StopFighting(ch, true);
    }

    Act(AT_ACTION, "$n disappears in a swirl of the Force.", ch, NULL, NULL, ActTarget::Room);
    CharacterFromRoom(ch);
    CharacterToRoom(ch, location);

    if(ch->Mount)
    {
        CharacterFromRoom(ch->Mount);
        CharacterToRoom(ch->Mount, location);
    }

    Act(AT_ACTION, "$n appears in a swirl of the Force.", ch, NULL, NULL, ActTarget::Room);
    do_look(ch, "auto");
}
