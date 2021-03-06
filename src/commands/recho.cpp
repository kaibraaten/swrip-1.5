#include "mud.hpp"
#include "character.hpp"

void do_recho( std::shared_ptr<Character> ch, std::string argument )
{
    std::string arg;
    short color = 0;

    if (ch->Flags.test(Flag::Plr::NoEmote))
    {
        ch->Echo("You are noemoted and can not recho.\r\n");
        return;
    }

    if ( argument.empty() )
    {
        ch->Echo("Recho what?\r\n");
        return;
    }

    OneArgument( argument, arg );

    if ( (color = GetColor ( argument )) )
    {
        argument = OneArgument ( argument, arg );
        EchoToRoom ( color, ch->InRoom, argument );
    }
    else
    {
        EchoToRoom ( AT_IMMORT, ch->InRoom, argument );
    }
}
