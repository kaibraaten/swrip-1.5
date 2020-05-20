#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_visible( Character *ch, std::string argument )
{
    StripAffect( ch, gsn_invis );
    StripAffect( ch, gsn_mass_invis );
    StripAffect( ch, gsn_sneak );

    if (!HasPermanentHide(ch))
        ch->AffectedBy.reset(Flag::Affect::Hide);

    ch->AffectedBy.reset(Flag::Affect::Invisible);

    if ( !HasPermanentSneak(ch) )
        ch->AffectedBy.reset(Flag::Affect::Sneak);

    ch->Echo("Ok.\r\n");
}
