#include <utility/random.hpp>
#include "character.hpp"
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "act.hpp"

void do_calculate_diff(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    int the_chance = 0, distance = 0;
    std::shared_ptr<Ship> ship;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);

    if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!&d\r\n");
        return;
    }

    if(ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!&d\r\n");
        return;
    }

    if((ship = GetShipFromNavSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be at a nav computer to calculate jumps.&d\r\n");
        return;
    }

    if(IsShipAutoflying(ship))
    {
        ch->Echo("&RYou'll have to turn off the ships autopilot first.&d\r\n");
        return;
    }

    if(ship->Class == SHIP_PLATFORM)
    {
        ch->Echo("&RAnd what exactly are you going to calculate?&d\r\n");
        return;
    }

    if(ship->Hyperdrive.Speed == 0)
    {
        ch->Echo("&RThis ship is not equipped with a hyperdrive!&d\r\n");
        return;
    }

    if(ship->State == SHIP_LANDED)
    {
        ch->Echo("&RYou can't do that until after you've launched!&d\r\n");
        return;
    }

    if(ship->Spaceobject == NULL)
    {
        ch->Echo("&RYou can only do that in realspace.&d\r\n");
        return;
    }

    if(arg1.empty() || arg2.empty() || arg3.empty())
    {
        ch->Echo("&WFormat: Calculate <x> <y> <z>&d\r\n");
        return;
    }

    the_chance = GetSkillLevel(ch, gsn_navigation);

    if(GetRandomPercent() > the_chance)
    {
        ch->Echo("&RYou cant seem to figure the charts out today.\r\n");
        LearnFromFailure(ch, gsn_navigation);
        return;
    }

    ship->Jump->x = ship->Position->x + strtol(arg1.c_str(), nullptr, 10);
    ship->Jump->y = ship->Position->y + strtol(arg2.c_str(), nullptr, 10);
    ship->Jump->z = ship->Position->z + strtol(arg3.c_str(), nullptr, 10);

    std::shared_ptr<Spaceobject> spaceobject = ship->CurrentJump;

    RandomizeVector(ship->Jump, ship->Instruments.AstroArray - 300, 300 - ship->Instruments.AstroArray);
    ship->Jump->x += (distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity : 0));
    ship->Jump->y += (distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity : 0));
    ship->Jump->z += (distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity : 0));

    for(auto spaceobj : Spaceobjects)
    {
        if(!spaceobj->IsSimulator && distance && !spaceobj->Name.empty()
           && GetDistanceBetweenVectors(ship->Jump, spaceobj->Position) < spaceobj->Gravity * 4)
        {
            EchoToCockpit(AT_RED, ship, "WARNING! Jump coordinates too close to stellar object.");
            EchoToCockpit(AT_RED, ship, "WARNING! Hyperjump NOT set.");
            ship->CurrentJump = NULL;
            return;
        }
    }

    for(auto iter : Spaceobjects)
    {
        if(IsSpaceobjectInRange(ship, iter))
        {
            ship->CurrentJump = iter;
            spaceobject = iter;
            break;
        }
    }

    if(!spaceobject)
        ship->CurrentJump = ship->Spaceobject;

    if(IsBeyondGalaxy(ship->Jump))
    {
        EchoToCockpit(AT_RED, ship, "WARNING! Jump coordinates outside of the known galaxy.");
        EchoToCockpit(AT_RED, ship, "WARNING! Hyperjump NOT set.");
        ship->CurrentJump = NULL;
        return;
    }

    ship->Hyperdistance = GetDistanceBetweenVectors(ship->Position, ship->Jump) / 200;

    if(ship->Hyperdistance < 100)
        ship->Hyperdistance = 100;

    ship->OriginalHyperdistance = ship->Hyperdistance;

    ch->Echo("&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.&d\r\n", ship->Hyperdistance);
    EchoToDockedShip(AT_YELLOW, ship, "The docking port link shows a new course being calculated.");

    Act(AT_PLAIN, "$n does some calculations using the ships computer.", ch,
        nullptr, argument, ActTarget::Room);

    LearnFromSuccess(ch, gsn_navigation);

    SetWaitState(ch, 2 * PULSE_VIOLENCE);
}

