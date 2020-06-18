#include <filesystem>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "room.hpp"
#include "repos/shiprepository.hpp"

void do_renameship(std::shared_ptr<Character> ch, std::string argument)
{
    constexpr auto COST_TO_RENAME = 50000;

    std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);

    if(ship == nullptr)
    {
        ch->Echo("You must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    std::shared_ptr<Clan> clan = GetClan(ship->Owner);

    if(clan == nullptr || StrCmp(clan->Leadership.Leader, ch->Name))
    {
        if(StrCmp(ship->Owner, ch->Name))
        {
            ch->Echo("&RImperial Database: &WYou do not own this ship.\r\n");
            return;
        }
    }

    if(GetShipAnywhere(argument) != NULL)
    {
        ch->Echo("&RImperial Database: &WA ship of that name already exists.\r\n");
        return;
    }


    if(ch->Gold < COST_TO_RENAME)
    {
        ch->Echo("&RImperial Database: &WYou do not have enough credits for this request.\r\n");
        return;
    }

    ch->Gold -= COST_TO_RENAME;
    std::string oldFilename = GetShipFilename(ship);
    std::filesystem::rename(oldFilename, oldFilename + ".bak");
    ship->PersonalName = argument;
    Ships->Save(ship);
    ch->Echo("&RImperial Database: &WTransaction Complete. Name changed.");
}
