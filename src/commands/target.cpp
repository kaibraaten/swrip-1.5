#include <cstring>
#include <utility/random.hpp>
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "turret.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

static void SynchronizeTargetWithDockedShips(std::shared_ptr<Ship> ship,
                                             std::shared_ptr<Ship> target);

void do_target(Character *ch, std::string arg)
{
    int the_chance = 0;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> target;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    bool is_turret = false;

    switch(ch->SubState)
    {
    default:
        if((ship = GetShipFromTurret(ch->InRoom->Vnum)) == NULL)
        {
            ch->Echo("&RYou must be in the gunners seat or turret of a ship to do that!\r\n");
            return;
        }

        if(ship->Rooms.Gunseat != ch->InRoom->Vnum)
            is_turret = true;

        if(IsShipInHyperspace(ship) && ship->Class <= SHIP_PLATFORM)
        {
            ch->Echo("&RYou can only do that in realspace!\r\n");
            return;
        }

        if(ship->Spaceobject == nullptr && ship->Class <= SHIP_PLATFORM)
        {
            ch->Echo("&RYou can't do that until you've finished launching!\r\n");
            return;
        }

        if(IsShipAutoflying(ship) && (!is_turret || !CheckPilot(ch, ship)))
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
            ch->Echo("&GTarget set to none.\r\n");

            if(ch->InRoom->Vnum == ship->Rooms.Gunseat)
                ship->WeaponSystems.Target = NULL;

            for(Turret *turret : ship->WeaponSystems.Turrets)
            {
                if(ch->InRoom->Vnum == GetTurretRoom(turret))
                {
                    ClearTurretTarget(turret);
                }
            }

            return;
        }

        if(ship->Class > SHIP_PLATFORM)
            target = GetShipInRoom(ship->InRoom, arg);
        else
            target = GetShipInRange(arg, ship);

        if(target == NULL)
        {
            ch->Echo("&RThat ship isn't here!\r\n");
            return;
        }

        if(target == ship)
        {
            ch->Echo("&RYou can't target your own ship!\r\n");
            return;
        }

        if(!StrCmp(ship->Owner, "Trainer") && StrCmp(target->Owner, "Trainer"))
        {
            ch->Echo("&RTrainers can only target other trainers!!\r\n");
            return;
        }

        if(StrCmp(ship->Owner, "Trainer") && !StrCmp(target->Owner, "Trainer"))
        {
            ch->Echo("&ROnly trainers can target other trainers!!\r\n");
            return;
        }

        if(ship->Class <= SHIP_PLATFORM)
        {
            if(GetShipDistanceToShip(ship, target) > 5000)
            {
                ch->Echo("&RThat ship is too far away to target.\r\n");
                return;
            }
        }

        the_chance = IsNpc(ch) ? ch->TopLevel
            : (int)(ch->PCData->Learned[gsn_weaponsystems]);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GTracking target.\r\n");
            Act(AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
                NULL, arg.c_str(), TO_ROOM);
            AddTimerToCharacter(ch, TIMER_CMD_FUN, 1, do_target, SUB_PAUSE);
            ch->dest_buf = arg;
            return;
        }

        ch->Echo("&RYou fail to work the controls properly.\r\n");
        LearnFromFailure(ch, gsn_weaponsystems);
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

    if((ship = GetShipFromTurret(ch->InRoom->Vnum)) == NULL)
    {
        return;
    }

    if(ship->Class > SHIP_PLATFORM)
        target = GetShipInRoom(ship->InRoom, arg);
    else
        target = GetShipInRange(arg, ship);

    if(target == NULL || target == ship)
    {
        ch->Echo("&RThe ship has left the starsytem. Targeting aborted.\r\n");
        return;
    }

    if(ch->InRoom->Vnum == ship->Rooms.Gunseat)
        ship->WeaponSystems.Target = target;

    for(Turret *turret : ship->WeaponSystems.Turrets)
    {
        if(ch->InRoom->Vnum == GetTurretRoom(turret))
        {
            SetTurretTarget(turret, target);
        }
    }

    ch->Echo("&GTarget locked.\r\n");
    sprintf(buf, "You are being targetted by %s.", ship->Name.c_str());
    EchoToCockpit(AT_BLOOD, target, buf);
    EchoToDockedShip(AT_YELLOW, ship, "The ship's computer receives targetting data through the docking port link.");

    if(ch->InRoom->Vnum == ship->Rooms.Gunseat)
    {
        SynchronizeTargetWithDockedShips(ship, target);
    }

    LearnFromSuccess(ch, gsn_weaponsystems);

    if(IsShipAutoflying(target) && !target->WeaponSystems.Target)
    {
        sprintf(buf, "You are being targetted by %s.", target->Name.c_str());
        EchoToCockpit(AT_BLOOD, ship, buf);
        target->WeaponSystems.Target = ship;
    }
}

struct UserData
{
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> target;
};

static bool SetSameTargetAsMothership(std::shared_ptr<Ship> dockedShip, void *userData)
{
    struct UserData *data = (struct UserData *)userData;
    std::shared_ptr<Ship> ship = data->ship;
    std::shared_ptr<Ship> target = data->target;

    if(dockedShip->Docked == ship)
    {
        dockedShip->WeaponSystems.Target = target;
    }

    return true;
}

static void SynchronizeTargetWithDockedShips(std::shared_ptr<Ship> ship,
                                             std::shared_ptr<Ship> target)
{
    UserData data;
    data.ship = ship;
    data.target = target;
    ForEachShip(SetSameTargetAsMothership, &data);
}
