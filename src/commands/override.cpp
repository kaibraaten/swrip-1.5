#include <cstring>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "room.hpp"
#include "act.hpp"

void do_override(Character *ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> eShip;

    argument = OneArgument(argument, arg);
    arg2 = argument;

    if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if(ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!");
        return;
    }

    if(!ship->Spaceobject)
    {
        ch->Echo("&RYou can't do that until you've finished launching!\r\n");
        return;
    }

    if(IsShipInHyperspace(ship))
    {
        ch->Echo("&RYou can only do that in realspace!\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("&ROverride the controls of what ship?\r\n");
        return;
    }

    eShip = GetShipInRange(arg, ship);

    if(eShip == NULL)
    {
        ch->Echo("&RThat ship isn't here!\r\n");
        return;
    }

    if(eShip == ship)
    {
        ch->Echo("&RYou are in the cockpit, just hit the controls!\r\n");
        return;
    }

    if(GetShipDistanceToShip(eShip, ship) > 100 * ((ship->Instruments.Comm) + (eShip->Instruments.Comm) + 20))
    {
        ch->Echo("&RThat ship is out of the range of your comm system.\r\n&w");
        return;
    }

    if(!CheckPilot(ch, eShip))
    {
        ch->Echo("&RHey! That's not your ship!");
        return;
    }

    if(!StrCmp(arg2, "shields"))
    {
        if(eShip->Defenses.Shield.Current == 0)
        {
            eShip->AutoRecharge = true;
            ch->Echo("&GShields on. Confirmed.\r\n");
            EchoToCockpit(AT_YELLOW, eShip, "Shields ON. Autorecharge ON.");
            return;
        }
        else
        {
            eShip->Defenses.Shield.Current = 0;
            eShip->AutoRecharge = false;
            ch->Echo("Shields down. Confirmed");
            return;
        }
    }

    if(!StrCmp(arg2, "closebay"))
    {
        eShip->BayOpen = false;
        ch->Echo("&GBays Close. Confirmed.\r\n");
        EchoToCockpit(AT_YELLOW, eShip, "Bays Open");
        sprintf(buf, "%s's bay doors close.", eShip->Name.c_str());
        EchoToNearbyShips(AT_YELLOW, eShip, buf);
        return;
    }

    if(!StrCmp(arg2, "stop"))
    {
        eShip->Thrusters.Speed.Current = 0;
        ch->Echo("&GBreaking Thrusters. Confirmed.\r\n");
        EchoToCockpit(AT_GREY, eShip, "Breaking thrusters fire and the ship stops.");
        sprintf(buf, "%s decelerates.", eShip->Name.c_str());
        EchoToNearbyShips(AT_GREY, eShip, buf);
        return;
    }

    if(!StrCmp(arg2, "autopilot"))
    {
        if(ship->Autopilot)
        {
            eShip->Autopilot = false;
            ch->Echo("&GYou toggle the autopilot.\r\n");
            EchoToCockpit(AT_YELLOW, eShip, "Autopilot OFF.");
            return;
        }
        else if(!ship->Autopilot)
        {
            eShip->Autopilot = true;
            ch->Echo("&GYou toggle the autopilot.\r\n");
            EchoToCockpit(AT_YELLOW, eShip, "Autopilot ON.");
            return;
        }
    }

    if(!StrCmp(arg2, "openbay"))
    {
        ch->Echo("&RYou open the bay doors of the remote ship.");
        Act(AT_PLAIN, "$n flips a switch on the control panel.",
            ch, NULL, argument.c_str(), ActTarget::Room);
        eShip->BayOpen = true;
        sprintf(buf, "%s's bay doors open.", eShip->Name.c_str());
        EchoToNearbyShips(AT_YELLOW, ship, buf);
        return;
    }

    ch->Echo("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n");
    ch->Echo("         openbay   closebay  stop  \r\n");
}

