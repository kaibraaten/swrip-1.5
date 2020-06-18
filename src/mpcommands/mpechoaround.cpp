#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

/* prints the message to everyone in the room other than the mob and victim */

void do_mpechoaround(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    Character *victim = nullptr;
    short color = 0;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    if(arg.empty())
    {
        ProgBug("Mpechoaround - No argument", ch);
        return;
    }

    if(!(victim = GetCharacterInRoomMudProg(ch, arg)))
    {
        ProgBug("Mpechoaround - victim does not exist", ch);
        return;
    }

    auto mobflags = ch->Flags;
    ch->Flags.reset(Flag::Mob::Secretive);

    if((color = GetColor(argument)))
    {
        argument = OneArgument(argument, arg);
        Act(color, argument, ch, NULL, victim, ActTarget::NotVict);
    }
    else
        Act(AT_ACTION, argument, ch, NULL, victim, ActTarget::NotVict);

    ch->Flags = mobflags;
}
