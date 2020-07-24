#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"
#include "timer.hpp"

void do_sabotage(std::shared_ptr<Character> ch, std::string arg)
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

        if(StrCmp(arg, "hull") && StrCmp(arg, "drive") &&
           StrCmp(arg, "launcher") && StrCmp(arg, "laser") &&
           StrCmp(arg, "docking") && StrCmp(arg, "tractor"))
        {
            ch->Echo("&RYou need to specify something to sabotage:\r\n");
            ch->Echo("&rTry: hull, drive, launcher, laser, docking, or tractor.\r\n");
            return;
        }

        the_chance = GetSkillLevel(ch, gsn_sabotage);

        if(GetRandomPercent() < the_chance)
        {
            ch->Echo("&GYou begin your work.\r\n");
            Act(AT_PLAIN, "$n begins working on the ship's $T.", ch,
                nullptr, arg, ActTarget::Room);

            AddTimer(ch, TimerType::Command, 15, do_sabotage);
            ch->dest_buf = arg;
            return;
        }

        ch->Echo("&RYou fail to figure out where to start.\r\n");
        LearnFromFailure(ch, gsn_sabotage);
        return;

    case CharacterSubState::Pause:
        if(ch->dest_buf.empty())
            return;

        arg = ch->dest_buf;
        ch->dest_buf.erase();
        break;

    case CharacterSubState::TimerDoAbort:
        ch->dest_buf.erase();
        ch->SubState = CharacterSubState::None;

        if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
            return;

        ch->Echo("&RYou are distracted and fail to finish your work.\r\n");
        return;
    }

    ch->SubState = CharacterSubState::None;

    if((ship = GetShipFromEngine(ch->InRoom->Vnum)) == NULL)
    {
        return;
    }

    if(!StrCmp(arg, "hull"))
    {
        change = urange(0,
                        GetRandomNumberFromRange((int)(GetSkillLevel(ch, gsn_sabotage) / 2), GetSkillLevel(ch, gsn_sabotage)),
                        ship->Defenses.Hull.Current);
        ship->Defenses.Hull.Current -= change;
        ch->Echo("&GSabotage complete. Hull strength decreased by %d points.\r\n", change);
    }

    if(!StrCmp(arg, "drive"))
    {
        if(ship->Location == ship->LastDock)
            ship->State = SHIP_DISABLED;
        else if(IsShipInHyperspace(ship))
            ch->Echo("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n");
        else
            ship->State = SHIP_DISABLED;

        ch->Echo("&GShip's drive damaged.\r\n");
    }

    if(!StrCmp(arg, "docking"))
    {
        ship->DockingState = SHIP_DISABLED;
        ch->Echo("&GDocking bay sabotaged.\r\n");
    }

    if(!StrCmp(arg, "tractor"))
    {
        ship->WeaponSystems.TractorBeam.State = SHIP_DISABLED;
        ch->Echo("&GTractorbeam sabotaged.\r\n");
    }

    if(!StrCmp(arg, "launcher"))
    {
        ship->WeaponSystems.Tube.State = MISSILE_DAMAGED;
        ch->Echo("&GMissile launcher sabotaged.\r\n");
    }

    if(!StrCmp(arg, "laser"))
    {
        ship->WeaponSystems.Laser.State = LASER_DAMAGED;
        ch->Echo("&GMain laser sabotaged.\r\n");
    }

    Act(AT_PLAIN, "$n finishes the work.", ch,
        nullptr, nullptr, ActTarget::Room);

    Log->Info("%s has sabotaged %s!", ch->Name.c_str(), ship->Name.c_str());

    LearnFromSuccess(ch, gsn_sabotage);
}
