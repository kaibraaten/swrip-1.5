#include <cstring>
#include <utility/random.hpp>
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "act.hpp"

void do_land(Character *ch, std::string argument)
{
    int the_chance = 0;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> target;
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Spaceobject> spaceobj;
    bool found = false;

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

    if((ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou need to be in the pilot seat!\r\n");
        return;
    }

    if(IsShipAutoflying(ship))
    {
        ch->Echo("&RYou'll have to turn off the ships autopilot first.\r\n");
        return;
    }

    if(ship->Class == SHIP_PLATFORM)
    {
        ch->Echo("&RYou can't land platforms\r\n");
        return;
    }

    if(ship->Class == CAPITAL_SHIP)
    {
        ch->Echo("&RThis ship is too big to land. You'll have to take a shuttle.\r\n");
        return;
    }

    if(IsShipDisabled(ship))
    {
        ch->Echo("&RThe ship's drive is disabled. Unable to land.\r\n");
        return;
    }

    if(ship->State == SHIP_LANDED)
    {
        if(ship->Docked == NULL)
        {
            ch->Echo("&RThe ship is already docked!\r\n");
            return;
        }
    }

    if(ship->Docking != SHIP_READY)
    {
        ch->Echo("&RYou can't do that while docked to another ship!\r\n");
        return;
    }

    if(IsShipInHyperspace(ship))
    {
        ch->Echo("&RYou can only do that in realspace!\r\n");
        return;
    }

    if(ship->TractoredBy && ship->TractoredBy->Class > ship->Class)
    {
        ch->Echo("&RYou can not move in a tractorbeam!\r\n");
        return;
    }

    if(ship->WeaponSystems.TractorBeam.Tractoring
       && ship->WeaponSystems.TractorBeam.Tractoring->Class > ship->Class)
    {
        ch->Echo("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n");
        return;
    }

    if(ship->State != SHIP_READY)
    {
        ch->Echo("&RPlease wait until the ship has finished its current maneuver.\r\n");
        return;
    }

    if(ship->Thrusters.Energy.Current < (25 + 25 * ((int)ship->Class)))
    {
        ch->Echo("&RThere's not enough fuel!\r\n");
        return;
    }

    if(argument.empty())
    {
        SetCharacterColor(AT_CYAN, ch);
        ch->Echo("Land where?\r\n\r\nChoices: ");

        for(std::list<std::shared_ptr<Spaceobject>>::const_iterator i = Spaceobjects->Entities().cbegin();
            i != Spaceobjects->Entities().cend(); ++i)
        {
            spaceobj = *i;

            if(IsSpaceobjectInRange(ship, spaceobj))
            {
                size_t siteNum = 0;

                for(siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum)
                {
                    const LandingSite *site = &spaceobj->LandingSites[siteNum];

                    if(site->Dock && !site->IsSecret)
                    {
                        ch->Echo("%s (%s)  %.0f %.0f %.0f\r\n         ",
                                 site->LocationName.c_str(),
                                 spaceobj->Name.c_str(),
                                 spaceobj->Position->x,
                                 spaceobj->Position->y,
                                 spaceobj->Position->z);
                    }
                }
            }
        }

        ch->Echo("\r\nYour Coordinates: %.0f %.0f %.0f\r\n",
                 ship->Position->x, ship->Position->y, ship->Position->z);
        return;
    }

    for(std::list<std::shared_ptr<Spaceobject>>::const_iterator i = Spaceobjects->Entities().cbegin();
        i != Spaceobjects->Entities().cend(); ++i)
    {
        spaceobj = *i;

        if(IsSpaceobjectInRange(ship, spaceobj)
           && GetLandingSiteFromLocationName(spaceobj, argument))
        {
            found = true;
            break;
        }
    }

    if(!found)
    {
        target = GetShipInRange(argument, ship);

        if(target == NULL)
        {
            ch->Echo("&RI don't see that here. Type land by itself for a list\r\n");
            return;
        }

        if(target == ship)
        {
            ch->Echo("&RYou can't land your ship inside itself!\r\n");
            return;
        }

        if(!target->Rooms.Hangar)
        {
            ch->Echo("&RThat ship has no hangar for you to land in!\r\n");
            return;
        }

        if(ship->Class == MIDSIZE_SHIP && target->Class == MIDSIZE_SHIP)
        {
            ch->Echo("&RThat ship is not big enough for your ship to land in!\r\n");
            return;
        }

        if(!target->BayOpen)
        {
            ch->Echo("&RTheir hangar is closed. You'll have to ask them to open it for you\r\n");
            return;
        }

        if(GetShipDistanceToShip(ship, target) > 200)
        {
            ch->Echo("&RThat ship is too far away! You'll have to fly a litlle closer.\r\n");
            return;
        }
    }
    else
    {
        ship->Spaceobject = spaceobj;

        if(GetShipDistanceToSpaceobject(ship, spaceobj) > 500)
        {
            ch->Echo("&RThat platform is too far away! You'll have to fly a little closer.\r\n");
            return;
        }
    }

    if(ship->Class == FIGHTER_SHIP)
        the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_starfighters]);

    if(ship->Class == MIDSIZE_SHIP)
        the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_midships]);

    if(GetRandomPercent() < the_chance)
    {
        SetCharacterColor(AT_GREEN, ch);
        ch->Echo("Landing sequence initiated.\r\n");
        Act(AT_PLAIN, "$n begins the landing sequence.", ch,
            NULL, argument.c_str(), TO_ROOM);
        sprintf(buf, "%s begins its landing sequence.", ship->Name.c_str());
        EchoToNearbyShips(AT_YELLOW, ship, buf);
        EchoToDockedShip(AT_YELLOW, ship, "The ship begins to enter the atmosphere.");

        EchoToShip(AT_YELLOW, ship, "The ship slowly begins its landing approach.");
        ship->LandingDestination = argument;
        ship->State = SHIP_LAND;

        if(ship->Class == FIGHTER_SHIP)
            LearnFromSuccess(ch, gsn_starfighters);

        if(ship->Class == MIDSIZE_SHIP)
            LearnFromSuccess(ch, gsn_midships);

        if(GetSpaceobjectFromDockVnum(ship->LastDock) != ship->Spaceobject)
        {
            ship->Ch = ch;
        }

        return;
    }

    ch->Echo("You fail to work the controls properly.\r\n");

    if(ship->Class == FIGHTER_SHIP)
        LearnFromFailure(ch, gsn_starfighters);
    else
        LearnFromFailure(ch, gsn_midships);
}


