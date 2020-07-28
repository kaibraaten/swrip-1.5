#include "character.hpp"
#include "mud.hpp"

void do_toplevel(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty() || arg2.empty() || !IsNumber(arg2))
    {
        ch->Echo("Syntax: toplevel <char> <level>.\r\n");
        return;
    }

    auto victim = GetCharacterInRoom(ch, arg1);

    if(victim == nullptr)
    {
        ch->Echo("That player is not here.\r\n");
        return;
    }

    int level = ToLong(arg2);

    if(level < 0 || level > MAX_LEVEL)
    {
        ch->Echo("Level must be 0 (reset) or 1 to %d.\r\n", MAX_LEVEL);
        return;
    }

    if(level > ch->TopLevel())
    {
        ch->Echo("Limited to your own top level.\r\n");
        return;
    }

    if(ch->TopLevel() < LEVEL_IMPLEMENTOR && victim->TopLevel() >= ch->TopLevel())
    {
        ch->Echo("You can't do that.\r\n");
        return;
    }

    victim->TopLevel(level);
    ch->Echo("Ok.\r\n");
}
