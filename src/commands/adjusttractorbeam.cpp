#include <cstring>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "room.hpp"
#include "act.hpp"

void do_adjusttractorbeam(Character *ch, std::string argument)
{
    char buf[MAX_INPUT_LENGTH];
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> eShip;

    if((ship = GetShipFromCoSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the copilot's seat of a ship to do that!\r\n");
        return;
    }

    if(!ship->WeaponSystems.TractorBeam.Tractoring || ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy != ship)
    {
        if(ship->WeaponSystems.TractorBeam.Tractoring && ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy != ship)
            ship->WeaponSystems.TractorBeam.Tractoring = NULL;

        ch->Echo("&RYour tractor beam is not trained on a ship.\r\n");
        return;
    }

    if(argument.empty())
    {
        sprintf(buf, "&RCurrent tractor beam settings: ");

        if(ship->WeaponSystems.TractorBeam.State == SHIP_DISABLED)
            strcat(buf, "Disabled.\r\n");

        if(ship->WeaponSystems.TractorBeam.Tractoring == NULL)
            strcat(buf, "Deactivated.\r\n");

        if(ship->WeaponSystems.TractorBeam.Tractoring && ship->WeaponSystems.TractorBeam.Tractoring->State == SHIP_TRACTORED)
            strcat(buf, "Pulling Target.\r\n");

        if(ship->WeaponSystems.TractorBeam.Tractoring && ship->WeaponSystems.TractorBeam.Tractoring->State >= SHIP_DOCKED)
            strcat(buf, "Docking Port Approach.\r\n");

        if(ship->WeaponSystems.TractorBeam.Tractoring
           && (ship->WeaponSystems.TractorBeam.Tractoring->State == SHIP_LAND_2
               || ship->WeaponSystems.TractorBeam.Tractoring->State == SHIP_LAND))
            strcat(buf, "Hangar Approach.\r\n");

        ch->Echo("&RCurrent tractor beam settings: %s\r\n", buf);
        return;
    }

    eShip = ship->WeaponSystems.TractorBeam.Tractoring;

    Act(AT_PLAIN, "$n flips a switch on the control panel.", ch,
        NULL, argument.c_str(), TO_ROOM);

    if(StrCmp(argument, "undock") && eShip->Docked && eShip->Docked != ship)
    {
        EchoToCockpit(AT_YELLOW, ship, "Tractor Beam set on docked ship. Undock it first.\r\n");
        return;
    }

    if(eShip->Class >= ship->Class)
    {
        EchoToCockpit(AT_YELLOW, ship, "Tractor Beam set on ship of a greater or equal mass as our own. It will not move.\r\n");
        return;
    }

    if(!eShip->Spaceobject)
    {
        EchoToCockpit(AT_YELLOW, ship, "Target is on the ground. There is no need to adjust the tractor beam.\r\n");
        return;
    }

    if(!StrCmp(argument, "pull") || !StrCmp(argument, "none"))
    {
        EchoToCockpit(AT_YELLOW, ship, "Tractor Beam set to pull target.\r\n");
        eShip->State = SHIP_TRACTORED;
        eShip->Docked = NULL;
        eShip->Docking = SHIP_READY;
        eShip->LandingDestination.erase();
        return;
    }

    if(!StrCmp(argument, "abort"))
    {
        EchoToCockpit(AT_YELLOW, ship, "Manuever aborted. Tractor beam returned to default setting.\r\n");
        eShip->State = SHIP_TRACTORED;
        eShip->Docked = NULL;
        eShip->Docking = SHIP_READY;
        eShip->LandingDestination.erase();
        return;
    }

    if(!StrCmp(argument, "dock"))
    {
        if(GetShipDistanceToShip(ship, eShip) > 100)
        {
            ch->Echo("&RYou aren't close enough to dock target.\r\n");
            return;
        }

        if(!CanDock(eShip) || !CanDock(ship))
        {
            ch->Echo("&RYou have no empty docking port.\r\n");
            return;
        }

        EchoToCockpit(AT_YELLOW, ship, "Tractor Beam set to dock target.\r\n");
        eShip->Docking = SHIP_DOCK;
        eShip->Docked = ship;
        return;
    }

    if(!StrCmp(argument, "land"))
    {
        if(GetShipDistanceToShip(ship, eShip) > 100)
        {
            ch->Echo("&RYou aren't close enough to the target to pull it into your hangar.\r\n");
            return;
        }

        if(!ship->Rooms.Hangar)
        {
            ch->Echo("&RYou have no hangar!\r\n");
            return;
        }

        if(!ship->BayOpen)
        {
            ch->Echo("&RThe bay is not open.\r\n");
            return;
        }

        if(ship->Class < eShip->Class || eShip->Class == SHIP_PLATFORM || eShip->Class == CAPITAL_SHIP)
        {
            ch->Echo("&RThat ship can not land in your bay.\r\n");
            return;
        }

        EchoToCockpit(AT_YELLOW, ship, "Tractor Beam set to land target.\r\n");
        eShip->State = SHIP_LAND;
        eShip->LandingDestination = ship->Name;
        return;
    }

    if(!StrCmp(argument, "undock"))
    {
        if(GetShipDistanceToShip(ship, eShip) > 100)
        {
            ch->Echo("&RYou aren't close enough to the target to pull it off its position.\r\n");
            return;
        }

        if(!eShip->Docked)
        {
            ch->Echo("&RYour target is not docked.\r\n");
            return;
        }

        EchoToCockpit(AT_YELLOW, ship, "Tractor beam set to undock target.\r\n");
        eShip->State = SHIP_TRACTORED;
        eShip->Docked->WeaponSystems.TractorBeam.State = SHIP_DISABLED;
        eShip->WeaponSystems.TractorBeam.State = SHIP_DISABLED;
        EchoToCockpit(AT_RED, eShip, "As a ship is torn from your docking bay, the clamps are damaged!.");
        EchoToCockpit(AT_RED, ship, "As your ship is torn from the docking bay, the clamps are damaged!.");
        eShip->Docked = NULL;
        eShip->Docking = SHIP_READY;
        return;
    }
}

