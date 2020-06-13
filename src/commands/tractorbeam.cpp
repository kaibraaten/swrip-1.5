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

void do_tractorbeam(Character *ch, std::string arg)
{
    int the_chance = 0;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> target;
    char buf[MAX_STRING_LENGTH] = { '\0' };

    switch(ch->SubState)
    {
    default:
        if((ship = GetShipFromCoSeat(ch->InRoom->Vnum)) == NULL)
        {
            ch->Echo("&RYou must be in the copilot's seat of a ship to do that!\r\n");
            return;
        }

        if(ship->Class > SHIP_PLATFORM)
        {
            ch->Echo("&RThis isn't a spacecraft!\r\n");
            return;
        }

        if(!ship->WeaponSystems.TractorBeam.Strength)
        {
            ch->Echo("&RThis craft does not have a tractorbeam!\r\n");
            return;
        }

        if(IsShipInHyperspace(ship) || !ship->Spaceobject)
        {
            ch->Echo("&RYou can only do that in realspace!\r\n");
            return;
        }

        if(ship->Docking != SHIP_READY)
        {
            ch->Echo("&RThe ship structure can not tolerate pressure from both tractorbeam and docking port.\r\n");
            return;
        }

        if(ship->State == SHIP_TRACTORED)
        {
            ch->Echo("&RYou can not move in a tractorbeam!\r\n");
            return;
        }

        if(IsShipAutoflying(ship))
        {
            ch->Echo("&RYou'll have to turn off the ship's autopilot first.\r\n");
            return;
        }

        if(arg.empty())
        {
            ch->Echo("&RYou need to specify a target!\r\n");
            return;
        }

        if(!StrCmp(arg, "none"))
        {
            ch->Echo("&GTractorbeam set to no target.\r\n");

            if(ship->WeaponSystems.TractorBeam.Tractoring
               && ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy == ship)
            {
                ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy = NULL;

                if(ship->WeaponSystems.TractorBeam.Tractoring->Location)
                    ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_LANDED;
                else if(ship->WeaponSystems.TractorBeam.Tractoring->State != SHIP_DOCKED ||
                        !IsShipDisabled(ship->WeaponSystems.TractorBeam.Tractoring))
                    ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_READY;
            }

            ship->WeaponSystems.TractorBeam.Tractoring = NULL;
            return;
        }

        if(ship->WeaponSystems.TractorBeam.Tractoring)
        {
            ch->Echo("&RReleasing previous target.\r\n");
            ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy = NULL;

            if(ship->WeaponSystems.TractorBeam.Tractoring->Location)
                ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_LANDED;
            else if(ship->WeaponSystems.TractorBeam.Tractoring->State != SHIP_DOCKED ||
                    !IsShipDisabled(ship->WeaponSystems.TractorBeam.Tractoring))
                ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_READY;
        }

        target = GetShipInRange(arg, ship);

        if(target == NULL)
        {
            ch->Echo("&RThat ship isn't here!\r\n");
            return;
        }

        if(target == ship)
        {
            ch->Echo("&RYou can't tractor your own ship!\r\n");
            return;
        }

        if(!StrCmp(ship->Owner, "Trainer") && StrCmp(target->Owner, "Trainer"))
        {
            ch->Echo("&RTrainers can only target other trainers!\r\n");
            return;
        }

        if(StrCmp(ship->Owner, "Trainer") && !StrCmp(target->Owner, "Trainer"))
        {
            ch->Echo("&ROnly trainers can target other trainers!\r\n");
            return;
        }

        if(ship->Thrusters.Energy.Current < (25 + 25 * ((int)target->Class)))
        {
            ch->Echo("&RThere's not enough fuel!\r\n");
            return;
        }

        if(ship->Class <= SHIP_PLATFORM)
        {
            if(GetShipDistanceToShip(ship, target) > 100 + ship->WeaponSystems.TractorBeam.Strength)
            {
                ch->Echo("&RThat ship is too far away to tractor.\r\n");
                return;
            }
        }

        the_chance = IsNpc(ch) ? ch->TopLevel
            : (int)(ch->PCData->Learned[gsn_tractorbeams]);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GTracking target.\r\n");
            Act(AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
                NULL, arg.c_str(), TO_ROOM);
            AddTimerToCharacter(ch, TIMER_CMD_FUN, 1, do_tractorbeam, SUB_PAUSE);
            ch->dest_buf = arg;
            return;
        }

        ch->Echo("&RYou fail to work the controls properly.\r\n");
        LearnFromFailure(ch, gsn_tractorbeams);
        return;

    case SUB_PAUSE:
        if(ch->dest_buf.empty())
            return;

        arg = ch->dest_buf;
        ch->dest_buf.erase();
        break;

    case SUB_TIMER_DO_ABORT:
        ch->dest_buf.erase();
        ch->SubState = SUB_NONE;

        if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
            return;

        ch->Echo("&RYour concentration is broken. You fail to lock onto your target.\r\n");
        return;
    }

    ch->SubState = SUB_NONE;

    if((ship = GetShipFromCoSeat(ch->InRoom->Vnum)) == NULL)
    {
        return;
    }

    target = GetShipInRange(arg, ship);

    if(target == NULL || target == ship)
    {
        ch->Echo("&RThe ship has left the starsystem. Targetting aborted.\r\n");
        return;
    }

    the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_tractorbeams]);

    the_chance += target->Class - ship->Class;
    the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
    the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
    the_chance -= GetShipDistanceToShip(ship, target) / (10 * (target->Class + 1));
    the_chance /= 2;
    the_chance = urange(1, the_chance, 99);

    if(GetRandomPercent() >= the_chance)
    {
        ch->Echo("&RYou fail to work the controls properly.\r\n");
        LearnFromFailure(ch, gsn_tractorbeams);
        return;
    }

    ship->WeaponSystems.TractorBeam.Tractoring = target;
    target->TractoredBy = ship;
    target->State = SHIP_TRACTORED;
    ship->Thrusters.Energy.Current -= 25 + 25 * target->Class;

    if(target->Class <= ship->Class)
    {
        target->Thrusters.Speed.Current = ship->WeaponSystems.TractorBeam.Strength / 2;
        SetShipCourseTowardsShip(target, ship);
    }

    if(target->Class > ship->Class)
    {
        ship->Thrusters.Speed.Current = ship->WeaponSystems.TractorBeam.Strength / 2;
        SetShipCourseTowardsShip(ship, target);
    }

    ch->Echo("&GTarget Locked.\r\n");
    sprintf(buf, "You have been locked in a tractor beam by %s.",
            ship->Name.c_str());
    EchoToCockpit(AT_BLOOD, target, buf);
    LearnFromSuccess(ch, gsn_tractorbeams);

    if(IsShipAutoflying(target)
       && !target->WeaponSystems.Target
       && StrCmp(target->Owner, ship->Owner))
    {
        sprintf(buf, "You are being targetted by %s.", target->Name.c_str());
        EchoToCockpit(AT_BLOOD, ship, buf);
        target->WeaponSystems.Target = ship;
    }
}
