#include "character.hpp"
#include "mud.hpp"

void do_deny( Character *ch, std::string arg )
{
    Character *victim = nullptr;

    if ( arg.empty() )
    {
        ch->Echo( "Deny whom?\r\n" );
        return;
    }

    if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
        ch->Echo( "They aren't here.\r\n" );
        return;
    }

    if ( IsNpc(victim) )
    {
        ch->Echo( "Not on NPC's.\r\n" );
        return;
    }

    if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
        ch->Echo( "You failed.\r\n" );
        return;
    }

    victim->Flags.set(Flag::Plr::Deny);
    victim->Echo( "You are denied access!\r\n" );
    ch->Echo( "OK.\r\n" );
    do_quit( victim, "" );
}
