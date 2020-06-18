#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "descriptor.hpp"

void do_return( std::shared_ptr<Character> ch, std::string argument )
{
    if ( !ch->Desc )
        return;

    if ( !ch->Desc->Original )
    {
        ch->Echo("You aren't switched.\r\n");
        return;
    }

    if (ch->Flags.test(Flag::Mob::Polymorphed))
    {
        ch->Echo("Use revert to return from a polymorphed mob.\r\n");
        return;
    }

    ch->Echo("You return to your original body.\r\n");

    if ( IsNpc( ch ) && IsAffectedBy( ch, Flag::Affect::Possess))
    {
        StripAffect( ch, gsn_possess );
        ch->AffectedBy.reset(Flag::Affect::Possess);
    }

    ch->Desc->Character       = ch->Desc->Original;
    ch->Desc->Original        = NULL;
    ch->Desc->Character->Desc = ch->Desc;
    ch->Desc->Character->Switched = NULL;
    ch->Desc                  = NULL;
}
