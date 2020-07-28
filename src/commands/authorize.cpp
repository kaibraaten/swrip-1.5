#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"
#include "descriptor.hpp"
#include "race.hpp"

static std::shared_ptr<Character> get_waiting_desc(const std::shared_ptr<Character> ch, const std::string &name);

void do_authorize(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    char buf[MAX_STRING_LENGTH];

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty())
    {
        ch->Echo("Usage:  authorize <player> <yes|name|no/deny>\r\n");
        ch->Echo("Pending authorizations:\r\n");
        ch->Echo(" Chosen Character Name\r\n");
        ch->Echo("---------------------------------------------\r\n");

        for(auto unauthed : PlayerCharacters)
        {
            if(IsWaitingForAuth(unauthed))
            {
                ch->Echo(" %s@%s new %s...\r\n",
                         unauthed->Name.c_str(),
                         unauthed->Desc->Remote.Hostname.c_str(),
                         RaceTable[unauthed->Race].Name);
            }
        }

        return;
    }

    auto victim = get_waiting_desc(ch, arg1);

    if(victim == NULL)
        return;

    if(arg2.empty() || !StrCmp(arg2, "accept") || !StrCmp(arg2, "yes"))
    {
        victim->PCData->AuthState = 3;
        victim->PCData->Flags.reset(Flag::PCData::Unauthed);

        victim->PCData->AuthedBy = ch->Name;
        sprintf(buf, "%s authorized %s", ch->Name.c_str(),
                victim->Name.c_str());
        ToChannel(buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel());
        ch->Echo("You have authorized %s.\r\n", victim->Name.c_str());

        victim->Echo("The MUD Administrators have accepted the name %s.\r\n"
                     "You are now fully authorized to play Rise in Power.\r\n",
                     victim->Name.c_str());
    }
    else if(!StrCmp(arg2, "no") || !StrCmp(arg2, "deny"))
    {
        victim->Echo("You have been denied access.\r\n");
        sprintf(buf, "%s denied authorization to %s", ch->Name.c_str(),
                victim->Name.c_str());
        ToChannel(buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel());
        ch->Echo("You have denied %s.\r\n", victim->Name.c_str());
        do_quit(victim, "");
    }
    else if(!StrCmp(arg2, "name") || !StrCmp(arg2, "n"))
    {
        sprintf(buf, "%s has denied %s's name", ch->Name.c_str(),
                victim->Name.c_str());
        ToChannel(buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel());
        victim->Echo("The MUD Administrators have found the name %s "
                     "to be unacceptable.\r\n"
                     "Use 'name' to change it to something more apropriate.\r\n",
                     victim->Name.c_str());
        ch->Echo("You requested %s change names.\r\n", victim->Name.c_str());
        victim->PCData->AuthState = 2;
    }
    else
    {
        ch->Echo("Invalid argument.\r\n");
    }
}

/*
 * Check if the name prefix uniquely identifies a char descriptor
 */
static std::shared_ptr<Character> get_waiting_desc(const std::shared_ptr<Character> ch, const std::string &name)
{
    std::shared_ptr<Character> ret_char;
    unsigned int number_of_hits = 0;

    for(auto victim : PlayerCharacters)
    {
        if(IsWaitingForAuth(victim) && !StringPrefix(name, victim->Name))
        {
            if(++number_of_hits > 1)
            {
                ch->Echo("%s does not uniquely identify a char.\r\n", name.c_str());
                return nullptr;
            }
        }

        ret_char = victim;
    }

    if(number_of_hits == 1)
    {
        return ret_char;
    }
    else
    {
        ch->Echo("No one like that waiting for authorization.\r\n");
        return nullptr;
    }
}

