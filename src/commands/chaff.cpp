#include <utility/random.hpp>
#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

void do_chaff(Character *ch, std::string argument)
{
    std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);

    if(ship == nullptr)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!&d\r\n");
        return;
    }

    if(ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!&d\r\n");
        return;
    }

    if((ship = GetShipFromCoSeat(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RThe controls are at the copilots seat!&d\r\n");
        return;
    }

    if(IsShipAutoflying(ship))
    {
        ch->Echo("&RYou'll have to turn the autopilot off first.&d\r\n");
        return;
    }

    if(IsShipInHyperspace(ship))
    {
        ch->Echo("&RYou can only do that in realspace!&d\r\n");
        return;
    }

    if(ship->State == SHIP_LANDED)
    {
        ch->Echo("&RYou can't do that until after you've launched!&d\r\n");
        return;
    }

    if(ship->Defenses.Chaff.Current <= 0)
    {
        ch->Echo("&RYou don't have any chaff to release!&d\r\n");
        return;
    }

    int the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_weaponsystems]);

    if(GetRandomPercent() <= the_chance)
    {
        ship->Defenses.Chaff.Current--;
        ship->Defenses.ChaffReleased++;

        Act(AT_PLAIN, "You flip the chaff release switch.", ch, nullptr, nullptr, ActTarget::Char);
        Act(AT_PLAIN, "$n flips a switch on the control panel.", ch,
            nullptr, argument, ActTarget::Room);
        EchoToCockpit(AT_YELLOW, ship, "A burst of chaff is released from the ship.");
        LearnFromSuccess(ch, gsn_weaponsystems);
    }
    else
    {
        ch->Echo("&RYou can't figure out which switch it is.&d\r\n");
        LearnFromFailure(ch, gsn_weaponsystems);
    }
}

