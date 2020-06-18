#include <utility/random.hpp>
#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

static int EnergyRequired(int current, int change)
{
    return abs((change - abs(current)) / 10);
}

void do_accelerate(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);

    if(ship == nullptr)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if(ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!\r\n");
        return;
    }

    if((ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RThe controls must be at the pilots chair.\r\n");
        return;
    }

    if(IsShipAutoflying(ship))
    {
        ch->Echo("&RYou'll have to turn off the ships autopilot first.\r\n");
        return;
    }

    if(ship->Class == SHIP_PLATFORM)
    {
        ch->Echo("&RPlatforms can't move!&d\r\n");
        return;
    }

    if(IsShipInHyperspace(ship))
    {
        ch->Echo("&RYou can only do that in realspace!&d\r\n");
        return;
    }

    if(IsShipDisabled(ship))
    {
        ch->Echo("&RThe ships drive is disabled. Unable to accelerate.&d\r\n");
        return;
    }

    if(ship->State == SHIP_LANDED)
    {
        ch->Echo("&RYou can't do that until after you've launched!&d\r\n");
        return;
    }

    if(ship->Docking != SHIP_READY)
    {
        ch->Echo("&RYou can't do that while docked to another ship!&d\r\n");
        return;
    }

    if(ship->TractoredBy && ship->TractoredBy->Class > ship->Class)
    {
        ch->Echo("&RYou can not move in a tractorbeam!&d\r\n");
        return;
    }

    if(ship->WeaponSystems.TractorBeam.Tractoring != nullptr
       && ship->WeaponSystems.TractorBeam.Tractoring->Class > ship->Class)
    {
        ch->Echo("&RYou can not move while a tractorbeam is locked on to such a large mass.&d\r\n");
        return;
    }

    int change = strtol(argument.c_str(), nullptr, 10);

    if(ship->Thrusters.Energy.Current < EnergyRequired(ship->Thrusters.Speed.Current, change))
    {
        ch->Echo("&RTheres not enough fuel!\r\n");
        return;
    }

    int the_chance = 0;

    if(ship->Class == FIGHTER_SHIP)
    {
        the_chance = GetSkillLevel(ch, gsn_starfighters);
    }
    else if(ship->Class == MIDSIZE_SHIP)
    {
        the_chance = GetSkillLevel(ch, gsn_midships);
    }
    else if(ship->Class == CAPITAL_SHIP)
    {
        /* changed mobs so they can not fly capital ships. Forcers could possess mobs
            and fly them - Darrik Vequir */
        the_chance = IsNpc(ch) ? 0 : GetSkillLevel(ch, gsn_capitalships);
    }

    if(GetRandomPercent() >= the_chance)
    {
        ch->Echo("&RYou fail to work the controls properly.\r\n");

        if(ship->Class == FIGHTER_SHIP)
        {
            LearnFromFailure(ch, gsn_starfighters);
        }
        else if(ship->Class == MIDSIZE_SHIP)
        {
            LearnFromFailure(ch, gsn_midships);
        }
        else if(ship->Class == CAPITAL_SHIP)
        {
            LearnFromFailure(ch, gsn_capitalships);
        }

        return;
    }

    Act(AT_PLAIN, "$n manipulates the ships controls.", ch,
        nullptr, argument, ActTarget::Room);

    if(change > ship->Thrusters.Speed.Current)
    {
        ship->InOrbitOf = NULL;
        ch->Echo("&GAccelerating\r\n");
        EchoToCockpit(AT_YELLOW, ship, "The ship begins to accelerate.");
        EchoToDockedShip(AT_YELLOW, ship, "The hull groans at an increase in speed.");
        sprintf(buf, "%s begins to speed up.", ship->Name.c_str());
        EchoToNearbyShips(AT_ORANGE, ship, buf);
    }

    if(change < ship->Thrusters.Speed.Current)
    {
        ch->Echo("&GDecelerating.\r\n");
        EchoToCockpit(AT_YELLOW, ship, "The ship begins to slow down.");
        EchoToDockedShip(AT_YELLOW, ship, "The hull groans as the ship slows.");
        sprintf(buf, "%s begins to slow down.", ship->Name.c_str());
        EchoToNearbyShips(AT_ORANGE, ship, buf);
    }

    ship->Thrusters.Energy.Current -= abs((change - abs(ship->Thrusters.Speed.Current)) / 10);
    ship->Thrusters.Speed.Current = urange(0, change, ship->Thrusters.Speed.Max);

    if(ship->Class == FIGHTER_SHIP)
    {
        LearnFromSuccess(ch, gsn_starfighters);
    }
    else if(ship->Class == MIDSIZE_SHIP)
    {
        LearnFromSuccess(ch, gsn_midships);
    }
    else if(ship->Class == CAPITAL_SHIP)
    {
        LearnFromSuccess(ch, gsn_capitalships);
    }
}
