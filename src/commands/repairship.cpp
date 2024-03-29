#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "turret.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"
#include "timer.hpp"

void do_repairship(std::shared_ptr<Character> ch, std::string argument)
{
    int the_chance = 0, change = 0;
    std::shared_ptr<Ship> ship;

    switch(ch->SubState)
    {
    default:
        if((ship = GetShipFromEngine(ch->InRoom->Vnum)) == NULL)
        {
            ch->Echo("&RYou must be in the engine room of a ship to do that!\r\n");
            return;
        }

        if(StrCmp(argument, "hull")
           && StrCmp(argument, "drive")
           && StrCmp(argument, "launcher")
           && StrCmp(argument, "laser")
           && StringPrefix("turret ", argument)
           && StrCmp(argument, "docking")
           && StrCmp(argument, "tractor"))
        {
            ch->Echo("&RYou need to specify something to repair:\r\n");
            ch->Echo("&rTry: hull, drive, launcher, laser, docking, tractor or turret <1 - %d>\r\n",
                     MAX_NUMBER_OF_TURRETS_IN_SHIP);
            return;
        }

        the_chance = GetSkillLevel(ch, gsn_shipmaintenance);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GYou begin your repairs\r\n");
            Act(AT_PLAIN, "$n begins repairing the ships $T.", ch,
                nullptr, argument, ActTarget::Room);
            int timeToRepair = 0;
            
            if(!StrCmp(argument, "hull"))
                timeToRepair = 15;
            else
                timeToRepair = 5;
                
            AddTimer(ch, TimerType::Command, timeToRepair, do_repairship);

            ch->dest_buf = argument;
            return;
        }

        ch->Echo("&RYou fail to locate the source of the problem.\r\n");
        LearnFromFailure(ch, gsn_shipmaintenance);
        return;

    case CharacterSubState::Pause:
        if(ch->dest_buf.empty())
            return;

        argument = ch->dest_buf;
        ch->dest_buf.erase();
        break;

    case CharacterSubState::TimerDoAbort:
        ch->dest_buf.erase();
        ch->SubState = CharacterSubState::None;

        if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
            return;

        ch->Echo("&RYou are distracted and fail to finish your repairs.\r\n");
        return;
    }

    ch->SubState = CharacterSubState::None;

    if((ship = GetShipFromEngine(ch->InRoom->Vnum)) == NULL)
    {
        return;
    }

    if(!StrCmp(argument, "hull"))
    {
        change = urange(0,
                        GetRandomNumberFromRange((int)(GetSkillLevel(ch, gsn_shipmaintenance) / 2), (int)(GetSkillLevel(ch, gsn_shipmaintenance))),
                        ship->Defenses.Hull.Max - ship->Defenses.Hull.Current);
        ship->Defenses.Hull.Current += change;
        ch->Echo("&GRepair complete. Hull strength increased by %d points.\r\n", change);
    }

    if(!StrCmp(argument, "drive"))
    {
        if(ship->Location == ship->LastDock)
            ship->State = SHIP_LANDED;
        else if(IsShipInHyperspace(ship))
            ch->Echo("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n");
        else
            ship->State = SHIP_READY;

        ch->Echo("&GShips drive repaired.\r\n");
    }

    if(!StrCmp(argument, "docking"))
    {
        ship->DockingState = SHIP_READY;
        ch->Echo("&GDocking bay repaired.\r\n");
    }

    if(!StrCmp(argument, "tractor"))
    {
        ship->WeaponSystems.TractorBeam.State = SHIP_READY;
        ch->Echo("&GTractorbeam repaired.\r\n");
    }

    if(!StrCmp(argument, "launcher"))
    {
        ship->WeaponSystems.Tube.State = MISSILE_READY;
        ch->Echo("&GMissile launcher repaired.\r\n");
    }

    if(!StrCmp(argument, "laser"))
    {
        ship->WeaponSystems.Laser.State = LASER_READY;
        ch->Echo("&GMain laser repaired.\r\n");
    }

    if(!StringPrefix("turret ", argument))
    {
        std::string number_string;
        long turret_number = 0;

        argument = OneArgument(argument, number_string);
        turret_number = ToLong(number_string);

        if(turret_number < 1 || turret_number > MAX_NUMBER_OF_TURRETS_IN_SHIP)
        {
            ch->Echo("Turret range is 1 - %d.\r\n", MAX_NUMBER_OF_TURRETS_IN_SHIP);
            return;
        }

        const auto &turret = ship->WeaponSystems.Turrets[turret_number - 1];

        if(!IsTurretInstalled(turret))
        {
            ch->Echo("This ship doesn't have that many turrets installed.\r\n");
            return;
        }

        ResetTurret(turret);
        ch->Echo("&GLaser Turret %ld repaired.\r\n", turret_number);
    }

    Act(AT_PLAIN, "$n finishes the repairs.", ch,
        nullptr, argument, ActTarget::Room);

    LearnFromSuccess(ch, gsn_shipmaintenance);
}
