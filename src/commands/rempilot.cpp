#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/shiprepository.hpp"

void do_rempilot(std::shared_ptr<Character> ch, std::string argument)
{
    int the_chance = 0;
    std::shared_ptr<Ship> ship;

    if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if(ship->Class == SHIP_PLATFORM)
    {
        ch->Echo("&RYou can't do that here.\r\n");
        return;
    }

    the_chance = GetRandomPercent();

    if(IsNpc(ch) || the_chance >= GetSkillLevel(ch, gsn_slicing))
    {
        if(!CheckPilot(ch, ship))
        {
            ch->Echo("&RThat isn't your ship!");
            return;
        }
    }

    if(argument.empty())
    {
        ch->Echo("&RRemove which pilot?\r\n");
        return;
    }

    if(the_chance < GetSkillLevel(ch, gsn_slicing))
        LearnFromSuccess(ch, gsn_slicing);

    if(!StrCmp(ship->Pilot, argument))
    {
        ship->Pilot.erase();
        ch->Echo("Pilot Removed.\r\n");
        Ships->Save(ship);
        return;
    }

    if(!StrCmp(ship->CoPilot, argument))
    {
        ship->CoPilot.erase();
        ch->Echo("Copilot Removed.\r\n");
        Ships->Save(ship);
        return;
    }

    ch->Echo("&RThat person isn't listed as one of the ships pilots.\r\n");
}
