#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_berserk(std::shared_ptr<Character> ch, std::string argument)
{
    short percent = 0;

    if(!IsFighting(ch))
    {
        ch->Echo("But you aren't fighting!\r\n");
        return;
    }

    if(IsAffectedBy(ch, Flag::Affect::Berserk))
    {
        ch->Echo("Your rage is already at its peak!\r\n");
        return;
    }

    percent = IsNpc(ch) ? 80 : GetSkillLevel(ch, gsn_berserk);
    SetWaitState(ch, SkillTable[gsn_berserk]->Beats);

    if(!Chance(ch, percent))
    {
        ch->Echo("You couldn't build up enough rage.\r\n");
        LearnFromFailure(ch, gsn_berserk);
        return;
    }

    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    af->Type = gsn_berserk;
    /* Hmmm.. 10-20 combat rounds at level 50.. good enough for most mobs,
       and if not they can always go berserk again.. shrug.. maybe even
       too high. -- Altrag */
    af->Duration = GetRandomNumberFromRange(ch->TopLevel / 5, ch->TopLevel * 2 / 5);
    /* Hmm.. you get stronger when yer really enraged.. mind over matter
       type thing.. */
    af->Location = APPLY_STR;
    af->Modifier = 1;
    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Berserk });
    AffectToCharacter(ch, af);
    ch->Echo("You start to lose control..\r\n");
    LearnFromSuccess(ch, gsn_berserk);
}
