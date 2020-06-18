#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "act.hpp"

static bool AffParalysis(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);

void do_bind(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;

    if(argument.empty())
    {
        ch->Echo("Bind whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, argument)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("Suicide is a mortal sin.\r\n");
        return;
    }

    if(victim->Flags.test(Flag::Plr::Afk))
    {
        Log->Info("%s just bound %s with an afk flag on!.",
                  ch->Name.c_str(), victim->Name.c_str());
    }

    if(IsSafe(ch, victim))
        return;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
    {
        if(ch->Master == victim)
        {
            Act(AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, ActTarget::Char);
            return;
        }
    }

    if(ch->Position == POS_FIGHTING)
    {
        ch->Echo("You are a little busy!\r\n");
        return;
    }

    ch->Alignment -= 10;

    SetWaitState(ch, 1 * PULSE_VIOLENCE);

    if(IsNpc(victim) || GetRandomPercent() > ch->PCData->Learned[gsn_bind])
    {
        ch->Echo("You fail.\r\n");
        return;
    }

    if(victim->Position != POS_STUNNED)
        return;

    Act(AT_YELLOW, "$n binds you up!", ch, NULL, victim, ActTarget::Vict);
    Act(AT_YELLOW, "You bind $N up.", ch, NULL, victim, ActTarget::Char);
    Act(AT_BLUE, "$n quickly binds $N, leaving $M helpless!", ch, NULL, victim, ActTarget::NotVict);
    AffParalysis(ch, victim);
    LearnFromSuccess(ch, gsn_bind);
}

static bool AffParalysis(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    std::shared_ptr<Affect> af = std::make_shared<Affect>();

    if(!IsAffectedBy(victim, Flag::Affect::Paralysis))
    {
        af->Type = gsn_stun;
        af->Location = APPLY_AC;
        af->Modifier = 20;
        af->Duration = 30;
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Paralysis });
        AffectToCharacter(victim, af);
        UpdatePosition(victim);

        if(IsNpc(victim))
        {
            StartHating(victim, ch);
            StartHunting(victim, ch);
            victim->WasStunned = 10;
        }
    }

    return true;
}
