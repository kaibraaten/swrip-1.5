#include "character.hpp"
#include "mud.hpp"
#include "repos/playerrepository.hpp"

void do_freeze( Character *ch, std::string argument )
{
    std::string arg;
    Character *victim = nullptr;

    OneArgument( argument, arg );

    if ( arg.empty() )
    {
        ch->Echo( "Freeze whom?\r\n" );
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

    victim->Flags.flip(Flag::Plr::Freeze);
    
    if (!victim->Flags.test(Flag::Plr::Freeze))
    {
        victim->Echo( "You can play again.\r\n" );
        ch->Echo( "FREEZE removed.\r\n" );
    }
    else
    {
        victim->Echo( "You can't do ANYthing!\r\n" );
        ch->Echo( "FREEZE set.\r\n" );
    }

    PlayerCharacters->Save( victim );
}
