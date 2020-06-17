#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "room.hpp"
#include "act.hpp"

void do_autopilot(Character *ch, std::string argument)
{
    std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);

    if(ship == nullptr)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if((ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the pilots seat!\r\n");
        return;
    }

    if(!CheckPilot(ch, ship))
    {
        ch->Echo("&RHey! Thats not your ship!\r\n");
        return;
    }

    if(ship->State == SHIP_DOCKED)
    {
        if(ship->Docked == NULL
           || (ship->Docked->Class > MIDSIZE_SHIP && ship->Class > MIDSIZE_SHIP))
        {
            ch->Echo("&RNot until after you've launched!\r\n");
            return;
        }

        ch->Echo("&RNot while you are docked!\r\n");
        return;
    }

    if(ship->WeaponSystems.Target)
    {
        ship->AutoTrack = false;
    }


    Act(AT_PLAIN, "$n flips a switch on the control panel.", ch,
        nullptr, nullptr, ActTarget::Room);

    if((ship->Autopilot == true && StrCmp(argument, "on"))
       || !StrCmp(argument, "off"))
    {
        ship->Autopilot = false;
        ch->Echo("&GYou toggle the autopilot.\r\n");
        EchoToCockpit(AT_YELLOW, ship, "Autopilot OFF.");
    }
    else
    {
        if(ship->State == SHIP_LANDED)
        {
            ch->Echo("&RNot while you are docked!\r\n");
            return;
        }

        ship->Autopilot = true;
        ship->AutoRecharge = true;
        ch->Echo("&GYou toggle the autopilot.\r\n");
        EchoToCockpit(AT_YELLOW, ship, "Autopilot ON.");
    }
}

