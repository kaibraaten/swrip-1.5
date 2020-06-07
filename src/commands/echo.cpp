#include "character.hpp"
#include "mud.hpp"

void do_echo( Character *ch, std::string argument )
{
    std::string arg;
    short color = AT_PLAIN;
    int target = 0;
    std::string parg;

    if (ch->Flags.test(Flag::Plr::NoEmote))
    {
        ch->Echo( "You are noemoted and can not echo.\r\n" );
        return;
    }

    if ( argument.empty() )
    {
        ch->Echo( "Echo what?\r\n" );
        return;
    }

    if ( (color = GetColor(argument)) )
    {
        argument = OneArgument(argument, arg);
    }

    parg = argument;
    argument = OneArgument(argument, arg);

    if ( !StrCmp( arg, "PC" ) || !StrCmp( arg, "player" ) )
    {
        target = ECHOTAR_PC;
    }
    else if ( !StrCmp( arg, "imm" ) )
    {
        target = ECHOTAR_IMM;
    }
    else
    {
        target = ECHOTAR_ALL;
        argument = parg;
    }

    if ( !color && (color = GetColor(argument)) )
        argument = OneArgument(argument, arg);

    if ( !color )
        color = AT_IMMORT;

    OneArgument(argument, arg);

    EchoToAll ( color, argument, target );
}
