#include "mud.hpp"
#include "character.hpp"

void do_retran(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;
    char buf[MAX_STRING_LENGTH];

    if(arg.empty())
    {
        ch->Echo("Retransfer whom?\r\n");
        return;
    }

    if(!(victim = GetCharacterAnywhere(ch, arg)))
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    sprintf(buf, "'%s' %ld", victim->Name.c_str(), victim->ReTran);
    do_transfer(ch, buf);
}

