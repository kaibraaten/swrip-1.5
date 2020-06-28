#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_sneak(std::shared_ptr<Character> ch, std::string argument)
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

    ch->Echo("You attempt to move silently.\r\n");
    StripAffect(ch, gsn_sneak);

    if(IsNpc(ch) || GetRandomPercent() < GetSkillLevel(ch, gsn_sneak))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = gsn_sneak;
        af->Duration = GetAbilityLevel(ch, SMUGGLING_ABILITY) * DUR_CONV;
        af->Location = APPLY_NONE;
        af->Modifier = 0;
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Sneak });
        AffectToCharacter(ch, af);
        LearnFromSuccess(ch, gsn_sneak);
    }
    else
    {
        LearnFromFailure(ch, gsn_sneak);
    }
}
