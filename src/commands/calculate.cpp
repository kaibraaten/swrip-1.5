#include <utility/random.hpp>
#include "character.hpp"
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "act.hpp"

void do_calculate(Character *ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    int the_chance = 0, distance = 0;
    std::shared_ptr<Ship> ship;
    bool found = false;

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
        ch->Echo("&RYou can't do that until after you've launched!\r\n");
        return;
    }

    if(ship->Spaceobject == NULL)
    {
        ch->Echo("&RYou can only do that in realspace.\r\n");
        return;
    }

    if(arg1.empty())
    {
        ch->Echo("&WFormat: Calculate <spaceobject> [distance]\r\n        Calculate <entry x> <entry y> <entry z>&d\r\n");
        ch->Echo("&wPossible destinations:\r\n");
        SetCharacterColor(AT_RED, ch);

        for(auto spaceobject : Spaceobjects)
        {
            if(spaceobject->Type <= SPACE_SUN && !(spaceobject->IsSimulator && !IsGreater(ch)))
            {
                ch->Echo("%s\r\n", spaceobject->Name.c_str());
            }
        }

        ch->Echo("\r\n");
        SetCharacterColor(AT_NOTE, ch);

        for(auto spaceobject : Spaceobjects)
        {
            if(spaceobject->Type == SPACE_PLANET
               && !(spaceobject->IsSimulator && (!IsGreater(ch))))
            {
                ch->Echo("%s\r\n", spaceobject->Name.c_str());
            }
        }

        return;
    }

    the_chance = IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[gsn_navigation]);

    if(GetRandomPercent() > the_chance)
    {
        ch->Echo("&RYou cant seem to figure the charts out today.\r\n");
        LearnFromFailure(ch, gsn_navigation);
        return;
    }

    if(!IsNumber(arg1) && arg1[0] != '-')
    {
        ship->CurrentJump = GetSpaceobject(arg1);

        if(!arg2.empty())
            distance = strtol(arg2.c_str(), nullptr, 10);

        if(ship->CurrentJump)
        {
            CopyVector(ship->Jump, ship->CurrentJump->Position);
            found = true;
        }
    }
    else if(!arg2.empty() && !arg3.empty())
    {
        SetVector(ship->Jump,
                  strtol(arg1.c_str(), nullptr, 10),
                  strtol(arg2.c_str(), nullptr, 10),
                  strtol(arg3.c_str(), nullptr, 10));
        found = true;
    }
    else
    {
        ch->Echo("&WFormat: Calculate <spaceobject> [distance]\r\n        Calculate <entry x> <entry y> <entry z>&d\r\n");
        return;
    }

    std::shared_ptr<Spaceobject> spaceobject = ship->CurrentJump;

    if(!found)
    {
        ch->Echo("&RYou can't seem to find that spacial object on your charts.\r\n");
        ship->CurrentJump = nullptr;
        return;
    }

    if(spaceobject && spaceobject->IsSimulator && (ship->Class != SHIP_TRAINER))
    {
        ch->Echo("&RYou can't seem to find that stellar object on your charts.\r\n");
        ship->CurrentJump = nullptr;
        return;
    }

    if(ship->Class == SHIP_TRAINER && spaceobject && !spaceobject->IsSimulator)
    {
        ch->Echo("&RYou can't seem to find that stellar object on your charts.\r\n");
        ship->CurrentJump = nullptr;
        return;
    }

    RandomizeVector(ship->Jump, ship->Instruments.AstroArray - 300, 300 - ship->Instruments.AstroArray);

    ship->Jump->x += distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity * 5 : 0);
    ship->Jump->y += distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity * 5 : 0);
    ship->Jump->z += distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity * 5 : 0);

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

    for(auto spaceobj : Spaceobjects)
    {
        if(IsSpaceobjectInRange(ship, spaceobj))
        {
            ship->CurrentJump = spaceobj;
            spaceobject = spaceobj;
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

    ch->Echo("&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.\r\n", ship->Hyperdistance);
    EchoToDockedShip(AT_YELLOW, ship, "The docking port link shows a new course being calculated.");

    Act(AT_PLAIN, "$n does some calculations using the ship's computer.", ch,
        NULL, argument.c_str(), TO_ROOM);

    LearnFromSuccess(ch, gsn_navigation);

    SetWaitState(ch, 2 * PULSE_VIOLENCE);
}
