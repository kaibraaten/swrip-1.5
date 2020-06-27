#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "act.hpp"

void do_peace(std::shared_ptr<Character> ch, std::string argument)
{
    Act(AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, ActTarget::Room);

    for(auto rch : ch->InRoom->Characters())
    {
        if(IsFighting(rch))
        {
            StopFighting(rch, true);
            do_sit(rch, "");
        }

        /* Added by Narn, Nov 28/95 */
        StopHating(rch);
        StopHunting(rch);
        StopFearing(rch);
    }

    ch->Echo("Ok.\r\n");
}
