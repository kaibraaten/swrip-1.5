#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

/* prints message to room at large. */

void do_mpecho(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    short color = 0;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(argument.empty())
    {
        ProgBug("Mpecho - called w/o argument", ch);
        return;
    }

    auto mobflags = ch->Flags;
    ch->Flags.reset(Flag::Mob::Secretive);

    if((color = GetColor(argument)))
    {
        argument = OneArgument(argument, arg1);
        Act(color, argument, ch, NULL, NULL, ActTarget::Room);
    }
    else
        Act(AT_ACTION, argument, ch, NULL, NULL, ActTarget::Room);

    ch->Flags = mobflags;
}
