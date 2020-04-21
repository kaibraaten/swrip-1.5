#include <cassert>
#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "repos/clanrepository.hpp"

static bool IsGuildNameAcceptable(const std::string& name);

void do_makeguild(Character* ch, std::string argument)
{
    std::string faction;
    std::shared_ptr<Clan> guild;
    std::shared_ptr<Clan> mainClan;
    argument = OneArgument(argument, faction);

    if (faction.empty() || argument.empty())
    {
        ch->Echo("Usage: startguild <imperial|rebel|independent> <guild name>\r\n");
        return;
    }

    if (IsClanned(ch))
    {
        ch->Echo("&RYou're already in a guild.&d\r\n");
        return;
    }

    if (!IsGuildNameAcceptable(argument))
    {
        ch->Echo("&RThat name is not accepted.&d\r\n");
        return;
    }

    if (!StrCmp(faction, "imperial"))
    {
        mainClan = GetClan(BADGUY_CLAN);
    }
    else if (!StrCmp(faction, "rebel"))
    {
        mainClan = GetClan(GOODGUY_CLAN);
    }
    else if (!StrCmp(faction, "independent"))
    {
        mainClan = GetClan(INDEPENDENT_CLAN);
    }
    else
    {
        ch->Echo("&RChoose faction for your guild: Imperial, Rebel or Independent.&d\r\n");
        return;
    }

    if (!mainClan)
    {
        ch->Echo("&RSomething when wrong. Contact the administration.&d\r\n");
        Log->Bug("%s: Main clan %s does not exist.", __FUNCTION__,
            !StrCmp(faction, "imperial") ? BADGUY_CLAN
            : !StrCmp(faction, "rebel") ? GOODGUY_CLAN : INDEPENDENT_CLAN);
        return;
    }

    if (ch->Gold < GUILD_PRICE)
    {
        ch->Echo("&RStarting a guild costs %d credits. You don't have the funds.&d\r\n",
            GUILD_PRICE);
        return;
    }
    else
    {
        assert(GUILD_PRICE >= 0);
        ch->Gold -= GUILD_PRICE;
    }

    guild = AllocateClan();
    Clans->Add(guild);

    guild->Name = argument;
    guild->Leadership.Leader = ch->Name;
    guild->MainClanName = mainClan->Name;
    guild->FoundationDate = current_time;

    Clans->Add(guild);
    AssignGuildToMainclan(guild, mainClan);
    Clans->Save(guild);

    ch->PCData->ClanInfo.Clan = guild;
    ch->PCData->ClanInfo.ClanName = guild->Name;
    UpdateClanMember(ch);

    ch->Echo("&GCongratulations, your new guild %s has been successfully created!\r\n",
        guild->Name.c_str());
    ch->Echo("See HELP GUILD to get started.&d\r\n");
}

static bool IsGuildNameAcceptable(const std::string& name)
{
    bool nameIsAvailable = GetClan(name) == nullptr;

    return nameIsAvailable
        && StringInfix("Jedi Order", name) != 0;
}
