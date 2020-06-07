#include "character.hpp"
#include "mud.hpp"

void do_ansi( Character *ch, std::string argument )
{
    if ( argument.empty() )
    {
        ch->Echo( "ANSI ON or OFF?\r\n" );
    }
    else if ( !StrCmp(argument, "on") )
    {
        ch->Flags.set(Flag::Plr::Ansi);
        SetCharacterColor( AT_WHITE + AT_BLINK, ch);
        ch->Echo( "ANSI ON!!!\r\n" );
    }
    else if ( !StrCmp(argument, "off") )
    {
        ch->Flags.reset(Flag::Plr::Ansi);
        ch->Echo( "Okay... ANSI support is now off\r\n" );
    }
}
