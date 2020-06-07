#include "character.hpp"
#include "mud.hpp"

void do_afk( Character *ch, std::string argument )
{
    if ( IsNpc(ch) )
        return;

    ch->Flags.flip(Flag::Plr::Afk);
    
    if(!ch->Flags.test(Flag::Plr::Afk))
    {
        ch->Echo( "You are no longer afk.\r\n" );
        Act(AT_GREY,"$n is no longer afk.", ch, NULL, NULL, TO_ROOM);
    }
    else
    {
        ch->Echo( "You are now afk.\r\n" );
        Act(AT_GREY,"$n is now afk.", ch, NULL, NULL, TO_ROOM);
    }
}
