#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/shiprepository.hpp"
#include "repos/clanrepository.hpp"
#include "act.hpp"

void do_clansellship(Character *ch, std::string argument)
{
    long price = 0;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Clan> clan;

    if(IsNpc(ch))
    {
        ch->Echo("&ROnly players can do that!\r\n");
        return;
    }

    if(!IsClanned(ch))
    {
        ch->Echo("&RYou aren't a member of any organizations!\r\n");
        return;
    }

    clan = ch->PCData->ClanInfo.Clan;

    if(IsName("clanbuyship", ch->PCData->Bestowments)
       || !StrCmp(ch->Name, clan->Leadership.Leader))
        ;
    else
    {
        ch->Echo("&RYour organization hasn't seen fit to bestow you with that ability.\r\n");
        return;
    }

    ship = GetShipInRoom(ch->InRoom, argument);

    if(!ship)
    {
        ship = GetShipFromCockpit(ch->InRoom->Vnum);

        if(!ship)
        {
            Act(AT_PLAIN, "I see no $T here.", ch, NULL, argument, ActTarget::Char);
            return;
        }
    }

    if(StrCmp(ship->Owner, clan->Name))
    {
        ch->Echo("&RThat isn't your ship!");
        return;
    }

    price = GetShipValue(ship);

    clan->Funds += (price - price / 10);
    ch->Echo("&G%s receives %ld credits from selling your ship.\r\n",
             clan->Name.c_str(), price - price / 10);

    Act(AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.", ch,
        NULL, argument, ActTarget::Room);

    ship->Owner.erase();
    ship->Pilot.erase();
    ship->CoPilot.erase();
    Ships->Save(ship);
    Clans->Save(clan);
}
