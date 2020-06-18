#include <stdexcept>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/playerrepository.hpp"

void do_clan_withdraw(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Clan> clan;
    long amount = 0;

    if (!IsClanned(ch))
    {
        ch->Echo("You don't seem to belong to an organization to withdraw funds from.\r\n");
        return;
    }

    if ((ch->PCData
        && IsName("withdraw", ch->PCData->Bestowments))
        || !StrCmp(ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader))
    {
        ;
    }
    else
    {
        ch->Echo("&RYour organization hasn't seen fit to bestow you with that ability.");
        return;
    }

    if (!HasComlink(ch)
        && !ch->InRoom->Flags.test(Flag::Room::Bank))
    {
        ch->Echo("You must be in a bank or have a comlink to do that!\r\n");
        return;
    }

    clan = ch->PCData->ClanInfo.Clan;

    try
    {
        amount = ToLong(argument);
    }
    catch (const std::invalid_argument&)
    {
        amount = 0;
    }

    if (amount == 0)
    {
        ch->Echo("How much would you like to withdraw?\r\n");
        return;
    }

    if (clan->Funds < amount)
    {
        ch->Echo("%s doesn't have that much!\r\n", clan->Name.c_str());
        return;
    }

    if (amount < 0)
    {
        ch->Echo("Nice try...\r\n");
        return;
    }

    ch->Echo("You withdraw %ld credits from %s's funds.\r\n", amount, clan->Name.c_str());

    clan->Funds -= amount;
    ch->Gold += amount;
    PlayerCharacters->Save(ch);
}

