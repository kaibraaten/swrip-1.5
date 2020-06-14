#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "act.hpp"

void do_peace(Character *ch, std::string argument)
{
    Act(AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, ActTarget::Room);

    for(Character *rch : ch->InRoom->Characters())
    {
        if(rch->Fighting)
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
