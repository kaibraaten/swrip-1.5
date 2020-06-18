#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "bounty.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_addbounty(std::shared_ptr<Character> ch, std::string argument)
{
    constexpr long MINIMUM_BOUNTY = 5000;
    std::string arg;
    long amount = 0;

    if(argument.empty())
    {
        do_bounties(ch, "");
        return;
    }

    argument = OneArgument(argument, arg);

    if(argument.empty())
    {
        ch->Echo("Usage: Addbounty <target> <amount>\r\n");
        return;
    }

    if(IsClanned(ch)
       && IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name))
    {
        ch->Echo("Your job is to collect bounties not post them.");
        return;
    }

    if(!ch->InRoom || ch->InRoom->Vnum != ROOM_VNUM_PLACE_BOUNTY)
    {
        ch->Echo("You will have to go to the Guild on Tatooine to add a new bounty.");
        return;
    }

    if(argument.empty())
        amount = 0;
    else
        amount = strtol(argument.c_str(), nullptr, 10);

    if(amount < MINIMUM_BOUNTY)
    {
        ch->Echo("A bounty should be at least %ld credits.\r\n", MINIMUM_BOUNTY);
        return;
    }

    auto victim = GetCharacterAnywhere(ch, arg);

    if(victim == nullptr)
    {
        ch->Echo("They don't appear to be here... wait til they log in.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("You can only set bounties on other players... not mobs!\r\n");
        return;
    }

    if(IsClanned(victim)
       && IsBountyHuntersGuild(victim->PCData->ClanInfo.Clan->Name))
    {
        ch->Echo("&RYou can not post bounties on bounty hunters!\r\n");
        return;
    }

    if(amount <= 0)
    {
        ch->Echo("Nice try! How about 1 or more credits instead...\r\n");
        return;
    }

    if(ch->Gold < amount)
    {
        ch->Echo("You don't have that many credits!\r\n");
        return;
    }

    ch->Gold = ch->Gold - amount;

    AddBounty(ch, victim, amount);
}

