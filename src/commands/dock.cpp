#include <cstring>
#include <utility/random.hpp>
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_dock(std::shared_ptr<Character> ch, std::string arg)
{
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
        ch->Echo("&RThis isn't a spacecraft!\r\n");
        return;
    }

    if(ship->Spaceobject == nullptr)
    {
        ch->Echo("&RYou can't do that until you've finished launching!\r\n");
        return;
    }

    if((ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou aren't in the pilots seat.\r\n");
        return;
    }

    if((ship->Autopilot || ship->Type == MOB_SHIP))
    {
        ch->Echo("&RYou'll have to turn off the ships autopilot first.\r\n");
        return;
    }

    if(ship->Class == SHIP_PLATFORM)
    {
        ch->Echo("&RPlatforms can't move!\r\n");
        return;
    }

    if(IsShipInHyperspace(ship))
    {
        ch->Echo("&RYou can only do that in realspace!\r\n");
        return;
    }

    if(IsShipDisabled(ship))
    {
        ch->Echo("&RThe ships drive is disabled. Unable to manuever.\r\n");
        return;
    }

    if(ship->DockingState == SHIP_DISABLED)
    {
        ch->Echo("&RYour docking port is damaged. Get it repaired!\r\n");
        return;
    }

    if(ship->Docking == SHIP_DOCKED)
    {
        ch->Echo("&RTry undocking first!\r\n");
        return;
    }

    if(!CanDock(ship))
    {
        ch->Echo("&RTry undocking first!\r\n");
        return;
    }

    if(ship->State == SHIP_LANDED)
    {
        ch->Echo("&RYou are already docked!\r\n");
        return;
    }

    if(ship->State == SHIP_TRACTORED
       && ship->TractoredBy != nullptr
       && ship->TractoredBy->Class >= ship->Class)
    {
        ch->Echo("&RYou can not move in a tractorbeam!\r\n");
        return;
    }

    if(ship->WeaponSystems.TractorBeam.Tractoring)
    {
        ch->Echo("&RThe ship structure can not tolerate stresses from both tractorbeam and docking port simultaneously.\r\n");
        return;
    }

    if(ship->State != SHIP_READY)
    {
        ch->Echo("&RPlease wait until the ship has finished its current maneuver.\r\n");
        return;
    }

    if(ship->Thrusters.Speed.Current < 1)
    {
        ch->Echo("&RYou need to speed up a little first!\r\n");
        return;
    }

    if(ship->Thrusters.Speed.Current > 120)
    {
        ch->Echo("&RYou need to slow down first!\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("&RDock where?\r\n");
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
        ch->Echo("&RYou can't dock with your own ship!\r\n");
        return;
    }

    if(ship->Class > eShip->Class)
    {
        ch->Echo("&RYou can not dock with a ship smaller than yours. Have them dock to you.\r\n");
        return;
    }

    if(!CanDock(eShip))
    {
        ch->Echo("&RYou can not seem to find an open docking port.\r\n");
        return;
    }


    if(eShip->Thrusters.Speed.Current > 0)
    {
        ch->Echo("&RThey need to be at a dead halt for the docking maneuver to begin.\r\n");
        return;
    }

    if(IsShipAutoflying(eShip))
    {
        ch->Echo("&RThe other ship needs to turn their autopilot off.\r\n");
        return;
    }

    if(GetShipDistanceToShip(ship, eShip) > 100)
    {
        ch->Echo("&RYou aren't close enough to dock. Get a little closer first then try again.\r\n");
        return;
    }

    if(ship->Class == FIGHTER_SHIP)
        the_chance = GetSkillLevel(ch, gsn_starfighters);
    else if(ship->Class == MIDSIZE_SHIP)
        the_chance = GetSkillLevel(ch, gsn_midships);
    else if(ship->Class == CAPITAL_SHIP)
        the_chance = GetSkillLevel(ch, gsn_capitalships);

    if(GetRandomPercent() > the_chance)
    {
        ch->Echo("&RYou can't figure out which lever to use.\r\n");

        if(ship->Class == FIGHTER_SHIP)
        {
            LearnFromFailure(ch, gsn_starfighters);
            LearnFromFailure(ch, gsn_shipdocking);
        }

        if(ship->Class == MIDSIZE_SHIP)
        {
            LearnFromFailure(ch, gsn_midships);
            LearnFromFailure(ch, gsn_shipdocking);
        }

        if(ship->Class == CAPITAL_SHIP)
        {
            LearnFromFailure(ch, gsn_capitalships);
            LearnFromFailure(ch, gsn_shipdocking);
        }

        return;
    }

    EchoToShip(AT_YELLOW, ship, "The ship slowly begins its docking maneuvers.");
    EchoToShip(AT_YELLOW, eShip, "The ship slowly begins its docking maneuvers.");
    ship->Docked = eShip;
    ship->Docking = SHIP_DOCK;
    ship->Ch = ch;
}

