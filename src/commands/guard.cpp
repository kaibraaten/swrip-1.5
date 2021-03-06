#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

void do_guard(std::shared_ptr<Character> ch, std::string argument)
{
    int the_chance = 0;
    std::shared_ptr<Ship> ship;

    if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if((ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the pilots seat!\r\n");
        return;
    }

    if(ship->Class != CAPITAL_SHIP && ship->Class != SHIP_PLATFORM)
    {
        ch->Echo("&ROnly capital-class vessels and platforms have this feature.\r\n");
        return;
    }

    the_chance = GetSkillLevel(ch, gsn_shipsystems);

    if(GetRandomPercent() > the_chance)
    {
        ch->Echo("&RYou fail to work the controls properly.\r\n");
        LearnFromFailure(ch, gsn_shipsystems);
        return;
    }

    Act(AT_PLAIN, "$n flips a switch on the control panel.", ch,
        nullptr, argument, ActTarget::Room);

    if(!StrCmp(argument, "on"))
    {
        ship->Guard = true;
        ch->Echo("&GYou activate the guard system.\r\n");
        EchoToCockpit(AT_YELLOW, ship, "Guard System: ACTIVATED.");
        ship->Thrusters.Speed.Current = 0;
    }
    else if(!StrCmp(argument, "off"))
    {
        ship->Guard = false;
        ch->Echo("&GYou shutdown the guard system.\r\n");
        EchoToCockpit(AT_YELLOW, ship, "Guard System: DEACTIVATED.");
    }
    else
    {
        if(ship->Guard == true)
        {
            ship->Guard = false;
            ch->Echo("&GYou shutdown the guard system.\r\n");
            EchoToCockpit(AT_YELLOW, ship, "Guard System: DEACTIVATED.");
        }
        else
        {
            ship->Guard = true;
            ch->Echo("&GYou activate the guard system.\r\n");
            EchoToCockpit(AT_YELLOW, ship, "Guard System: ACTIVATED.");
            ship->Thrusters.Speed.Current = 0;
        }
    }

    LearnFromSuccess(ch, gsn_shipsystems);
}
