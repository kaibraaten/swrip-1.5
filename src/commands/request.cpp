#include <cstring>
#include <utility/random.hpp>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

void do_request(Character *ch, std::string arg)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    int the_chance = 0;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> eShip;

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
        ch->Echo("&RRequest the opening of the baydoors of what ship?\r\n");
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
        ch->Echo("&RIf you have bay doors, why not open them yourself?\r\n");
        return;
    }

    if(eShip->Rooms.Hangar == INVALID_VNUM)
    {
        ch->Echo("&RThat ship has no hangar!");
        return;
    }

    if(!IsShipAutoflying(eShip))
    {
        ch->Echo("&RThe other ship needs to have its autopilot turned on.\r\n");
        return;
    }

    if(GetShipDistanceToShip(eShip, ship) > 100 * ((ship->Instruments.Comm) + (eShip->Instruments.Comm) + 20))
    {
        ch->Echo("&RThat ship is out of the range of your comm system.\r\n&w");
        return;
    }

    if(GetShipDistanceToShip(eShip, ship) > 100 * (ship->Instruments.Sensor + 10) * ((eShip->Class) + 1))
    {
        ch->Echo("&RThat ship is too far away to remotely open bay doors.\r\n");
        return;
    }

    the_chance = IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[gsn_fake_signal]);

    if((eShip->Class == SHIP_PLATFORM ? 1 : (GetRandomPercent() >= the_chance))
       && !CheckPilot(ch, eShip))
    {
        ch->Echo("&RHey! That's not your ship!\r\n");
        return;
    }

    if(eShip->BayOpen == true)
    {
        ch->Echo("&RThat ship's bay doors are already open!\r\n");
        return;
    }
    if(the_chance && !CheckPilot(ch, eShip))
        LearnFromSuccess(ch, gsn_fake_signal);

    ch->Echo("You open the bay doors of the remote ship.\r\n");
    Act(AT_PLAIN, "$n flips a switch on the control panel.",
        ch, nullptr, arg.c_str(), ActTarget::Room);
    eShip->BayOpen = true;
    sprintf(buf, "%s's bay doors open.", eShip->Name.c_str());
    EchoToNearbyShips(AT_YELLOW, ship, buf);
}

