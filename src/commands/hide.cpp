#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_hide(std::shared_ptr<Character> ch, std::string argument)
{
    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    ch->Echo("You make an attempt at stealth.\r\n");

    if(IsAffectedBy(ch, Flag::Affect::Hide))
    {
        ch->AffectedBy.reset(Flag::Affect::Hide);
    }

    if(IsNpc(ch) || GetRandomPercent() < GetSkillLevel(ch, gsn_hide))
    {
        ch->AffectedBy.set(Flag::Affect::Hide);
        LearnFromSuccess(ch, gsn_hide);
    }
    else
    {
        LearnFromFailure(ch, gsn_hide);
    }
}
