#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "ship.hpp"
#include "repos/clanrepository.hpp"

struct UpdateOwnerNameData
{
    std::string OldName;
    std::string NewName;
};

static bool UpdateOwnerName(std::shared_ptr<Ship> ship, UpdateOwnerNameData *data);

void do_setclan(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::shared_ptr<Clan> clan;

    if(IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty() || arg2.empty() || argument.empty())
    {
        ch->Echo("Usage: setclan <clan> <field> <leader|number1|number2> <player>\r\n");
        ch->Echo("\r\nField being one of:\r\n");
        ch->Echo("  leader number1 number2 addguild enlist1 jail\r\n");
        ch->Echo("  enlist2 board storage funds\r\n");

        if(GetTrustLevel(ch) >= LEVEL_SUB_IMPLEM)
        {
            ch->Echo("  name desc\r\n");
        }

        return;
    }

    clan = GetClan(arg1);

    if(!clan)
    {
        ch->Echo("No such clan.\r\n");
        return;
    }

    if(!StrCmp(arg2, "enlistroom1"))
    {
        clan->EnlistRoom1 = ToLong(argument);
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "enlistroom2"))
    {
        clan->EnlistRoom2 = ToLong(argument);
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "leader"))
    {
        clan->Leadership.Leader = argument;
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "addguild"))
    {
        std::shared_ptr<Clan> guild = GetClan(argument);

        if(!guild)
        {
            ch->Echo("Guild does't exist.\r\n");
            return;
        }

        if(guild->Type == ClanType::Guild || guild->MainClan)
        {
            ch->Echo("Guild is already part of another faction.\r\n");
            return;
        }

        if(!guild->Subclans().empty())
        {
            ch->Echo("Guild has guilds of its own that need removing first.\r\n");
            return;
        }

        AssignGuildToMainclan(clan, guild);

        Clans->Save(clan);
        Clans->Save(guild);
        return;
    }

    if(!StrCmp(arg2, "number1"))
    {
        clan->Leadership.Number1 = argument;
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "number2"))
    {
        clan->Leadership.Number2 = argument;
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "board"))
    {
        clan->Board = ToLong(argument);
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "funds"))
    {
        clan->Funds = ToLong(argument);
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "storage"))
    {
        clan->Storeroom = ToLong(argument);
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "jail"))
    {
        clan->Jail = ToLong(argument);
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(GetTrustLevel(ch) < LEVEL_SUB_IMPLEM)
    {
        do_setclan(ch, "");
        return;
    }

    if(!StrCmp(arg2, "name"))
    {
        UpdateOwnerNameData data;

        data.OldName = clan->Name;
        data.NewName = argument;

        if(GetClan(argument))
        {
            ch->Echo("There's already another guild with that name.");
            return;
        }

        ForEachShip(UpdateOwnerName, &data);

        unlink(GetClanFilename(clan).c_str());

        clan->Name = argument;

        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    if(!StrCmp(arg2, "desc"))
    {
        clan->Description = argument;
        ch->Echo("Done.\r\n");
        Clans->Save(clan);
        return;
    }

    do_setclan(ch, "");
}

static bool UpdateOwnerName(std::shared_ptr<Ship> ship, UpdateOwnerNameData *data)
{
    if(!StrCmp(ship->Owner, data->OldName))
    {
        ship->Owner = data->NewName;
    }

    return true;
}
