#include <utility/random.hpp>
#include "turret.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_launch(Character *ch, std::string argument)
{
    int the_chance = 0;
    long price = 0;
    std::shared_ptr<Ship> ship;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::shared_ptr<Room> room;

    if ((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if (ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!\r\n");
        return;
    }

    if ((ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou don't seem to be in the pilot seat!\r\n");
        return;
    }

    if (IsShipAutoflying(ship))
    {
        ch->Echo("&RThe ship is set on autopilot, you'll have to turn it off first.\r\n");
        return;
    }

    if (ship->Class == SHIP_PLATFORM)
    {
        ch->Echo("You can't do that here.\r\n");
        return;
    }

    if (!CheckPilot(ch, ship))
    {
        ch->Echo("&RHey, thats not your ship! Try renting a public one.\r\n");
        return;
    }

    if (ship->LastDock != ship->Location)
    {
        ch->Echo("&rYou don't seem to be docked right now.\r\n");
        return;
    }

    if (ship->TractoredBy)
    {
        ch->Echo("&rYou are still locked in a tractor beam!\r\n");
        return;
    }

    if (ship->Docking != SHIP_READY)
    {
        ch->Echo("&RYou can't do that while docked to another ship!\r\n");
        return;
    }
    if (ship->State != SHIP_LANDED && !IsShipDisabled(ship))
    {
        ch->Echo("The ship is not docked right now.\r\n");
        return;
    }

    if (ship->Thrusters.Energy.Current == 0)
    {
        ch->Echo("&RThis ship has no fuel.\r\n");
        return;
    }

    if (ship->Class <= FIGHTER_SHIP)
        the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_starfighters]);

    if (ship->Class == MIDSIZE_SHIP)
        the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_midships]);

    if (ship->Class == CAPITAL_SHIP)
        the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_capitalships]);

    if (GetRandomPercent() < the_chance)
    {
        if (IsShipRental(ch, ship))
            if (!RentShip(ch, ship))
                return;

        if (!IsShipRental(ch, ship))
        {
            if (ship->Class == FIGHTER_SHIP)
                price = 2000;

            if (ship->Class == MIDSIZE_SHIP)
                price = 5000;

            if (ship->Class == CAPITAL_SHIP)
                price = 50000;

            price += (ship->Defenses.Hull.Max - ship->Defenses.Hull.Current);

            if (IsShipDisabled(ship))
                price += 10000;

            if (ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
                price += 5000;

            if (ship->WeaponSystems.Laser.State == LASER_DAMAGED)
                price += 2500;

            for (const Turret *turret : ship->WeaponSystems.Turrets)
            {
                if (IsTurretDamaged(turret))
                {
                    price += 2500;
                }
            }
        }

        if (ch->Flags.test(Flag::Plr::DontAutofuel))
        {
            if (IsShipDisabled(ship))
            {
                ch->Echo("Your ship is disabled. You must repair it.\r\n");
                return;
            }

            price = 100;
        }

        if (IsClanned(ch)
            && !StrCmp(ch->PCData->ClanInfo.Clan->Name, ship->Owner))
        {
            if (ch->PCData->ClanInfo.Clan->Funds < price)
            {
                ch->Echo("&R%s doesn't have enough funds to prepare this ship for launch.\r\n",
                    ch->PCData->ClanInfo.Clan->Name.c_str());
                return;
            }

            ch->PCData->ClanInfo.Clan->Funds -= price;
            room = GetRoom(ship->Location);

            if (room != NULL && room->Area)
                BoostEconomy(room->Area, price);

            ch->Echo("&GIt costs %s %ld credits to ready this ship for launch.\r\n",
                ch->PCData->ClanInfo.Clan->Name.c_str(), price);
        }
        else if (StrCmp(ship->Owner, "Public"))
        {
            if (ch->Gold < price)
            {
                ch->Echo("&RYou don't have enough funds to prepare this ship for launch.\r\n");
                return;
            }

            ch->Gold -= price;
            room = GetRoom(ship->Location);

            if (room != NULL && room->Area)
                BoostEconomy(room->Area, price);

            ch->Echo("&GYou pay %ld credits to ready the ship for launch.\r\n", price);
        }

        if (!ch->Flags.test(Flag::Plr::DontAutofuel))
        {
            if (GetShipFromHangar(ship->InRoom->Vnum) == NULL || ship->Class == SHIP_PLATFORM)
            {
                ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
            }

            ship->Defenses.Shield.Current = 0;
            ship->AutoRecharge = false;
            ship->AutoTrack = false;
            ship->AutoSpeed = false;
            ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;

            ship->WeaponSystems.Tube.State = MISSILE_READY;
            ship->WeaponSystems.Laser.State = LASER_READY;

            for (Turret *turret : ship->WeaponSystems.Turrets)
            {
                SetTurretReady(turret);
            }

            ship->State = SHIP_LANDED;
        }

        if (ship->HatchOpen)
        {
            ship->HatchOpen = false;
            sprintf(buf, "The hatch on %s closes.", ship->Name.c_str());
            EchoToRoom(AT_YELLOW, GetRoom(ship->Location), buf);
            EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Entrance), "The hatch slides shut.");
        }

        SetCharacterColor(AT_GREEN, ch);
        ch->Echo("Launch sequence initiated.\r\n");
        Act(AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
            NULL, argument.c_str(), TO_ROOM);
        EchoToShip(AT_YELLOW, ship, "The ship hums as it lifts off the ground.");
        sprintf(buf, "%s begins to launch.", ship->Name.c_str());
        EchoToRoom(AT_YELLOW, GetRoom(ship->Location), buf);
        EchoToDockedShip(AT_YELLOW, ship, "The ship shudders as it lifts off the ground.");
        ship->State = SHIP_LAUNCH;
        ship->Thrusters.Speed.Current = ship->Thrusters.Speed.Max;

        if (ship->Class == FIGHTER_SHIP)
            LearnFromSuccess(ch, gsn_starfighters);

        if (ship->Class == MIDSIZE_SHIP)
            LearnFromSuccess(ch, gsn_midships);

        if (ship->Class == CAPITAL_SHIP)
            LearnFromSuccess(ch, gsn_capitalships);

        return;
    }

    SetCharacterColor(AT_RED, ch);
    ch->Echo("You fail to work the controls properly!\r\n");

    if (ship->Class == FIGHTER_SHIP)
        LearnFromFailure(ch, gsn_starfighters);

    if (ship->Class == MIDSIZE_SHIP)
        LearnFromFailure(ch, gsn_midships);

    if (ship->Class == CAPITAL_SHIP)
        LearnFromFailure(ch, gsn_capitalships);
}


