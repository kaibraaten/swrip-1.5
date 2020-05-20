#include "character.hpp"
#include "mud.hpp"

void do_mpgain( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    Character *victim = nullptr;
    long xp = 0;
    int  ability = 0;

    if ( IsAffectedBy( ch, Flag::Affect::Charm))
        return;

    if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument( argument, arg1 );
    argument = OneArgument( argument, arg2 );
    argument = OneArgument( argument, arg3 );

    if ( arg1.empty() )
    {
        ch->Echo("mpgain whom?\r\n");
        ProgBug( "Mpgain: invalid argument1", ch );
        return;
    }

    if ( arg2.empty() )
    {
        ch->Echo("mpgain in what ability?\r\n");
        ProgBug( "Mpgain: invalid argument2", ch );
        return;
    }

    if ( arg3.empty() )
    {
        ch->Echo("mpgain how much exp?\r\n");
        ProgBug( "Mpgain: invalid argument3", ch );
        return;
    }

    if ( ( victim = GetCharacterInRoomMudProg( ch, arg1 ) ) == NULL )
    {
        ch->Echo("Victim must be in room.\r\n");
        ProgBug( "Mpgain: victim not in room", ch );
        return;
    }

    ability = ToLong(arg2);
    xp = ToLong(arg3);

    if( ability < 0 || ability >= MAX_ABILITY )
    {
        ch->Echo("Mpgain which ability?\r\n");
        ProgBug( "Mpgain: ability out of range", ch );
        return;
    }

    if( (xp < 1) )
    {
        ch->Echo("Mpgain how much?\r\n");
        ProgBug( "Mpgain: experience out of range", ch );
        return;
    }

    xp = urange(1, xp, ( GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) + 1 ) - GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) ) ) );

    victim->Echo("You gain %ld %s experience.\r\n", xp, AbilityName[ability]  );
    GainXP( victim, ability, xp );
}
