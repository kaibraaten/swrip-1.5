#include "character.hpp"
#include "mud.hpp"

void do_holylight( Character *ch, std::string argument )
{
    if ( IsNpc(ch) )
        return;

    ch->Flags.flip(Flag::Plr::Holylight);
    
    if (ch->Flags.test(Flag::Plr::Holylight))
    {
        ch->Echo("Holy light mode on.\r\n");
    }
    else
    {
        ch->Echo("Holy light mode off.\r\n");
    }
}
