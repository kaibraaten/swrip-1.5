#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "repos/shiprepository.hpp"
#include "act.hpp"

void do_sellship(std::shared_ptr<Character> ch, std::string argument)
{
    long price = 0;
    std::shared_ptr<Ship> ship;

    ship = GetShipInRoom(ch->InRoom, argument);

    if(!ship)
    {
        Act(AT_PLAIN, "I see no $T here.",
            ch, nullptr, argument, ActTarget::Char);
        return;
    }

    if(StrCmp(ship->Owner, ch->Name))
    {
        ch->Echo("&RThat isn't your ship!");
        return;
    }

    price = GetShipValue(ship);

    ch->Gold += (price - price / 10);
    ch->Echo("&GYou receive %ld credits from selling your ship.\r\n", price - price / 10);

    Act(AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",
        ch, nullptr, argument, ActTarget::Room);

    ship->Owner.erase();
    ship->Pilot.erase();
    ship->CoPilot.erase();
    Ships->Save(ship);
}
