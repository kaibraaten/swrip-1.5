#include "character.hpp"
#include "mud.hpp"

/* prints message only to victim */

void do_mpechoat( Character *ch, std::string argument )
{
    std::string arg;
    Character *victim = nullptr;
    int mobflags = 0;
    short color = 0;

    if ( IsAffectedBy( ch, Flag::Affect::Charm))
        return;

    if ( !IsNpc( ch ) )
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument( argument, arg );

    if ( arg.empty() || argument.empty() )
    {
        ProgBug( "Mpechoat - No argument", ch );
        return;
    }

    if ( !( victim = GetCharacterInRoomMudProg( ch, arg ) ) )
    {
        ProgBug( "Mpechoat - victim does not exist", ch );
        return;
    }

    mobflags = ch->Flags;
    RemoveBit(ch->Flags, ACT_SECRETIVE);

    if ( (color = GetColor(argument)) )
    {
        argument = OneArgument( argument, arg );
        Act( color, argument, ch, NULL, victim, TO_VICT );
    }
    else
        Act( AT_ACTION, argument, ch, NULL, victim, TO_VICT );

    ch->Flags = mobflags;
}
