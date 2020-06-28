#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_seduce(std::shared_ptr<Character> ch, std::string arg)
{
    char buf[MAX_INPUT_LENGTH];
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Seduce whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsAffectedBy(victim, Flag::Affect::Charm) && victim->Master)
    {
        Act(AT_PLAIN, "But he'd rather follow $N!", ch, NULL, victim->Master, ActTarget::Char);
        return;
    }

    if(IsFollowingInCircle(victim, ch))
    {
        ch->Echo("Following in loops is not allowed... sorry.\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_seduce]->Beats);

    if(victim->TopLevel - GetCurrentCharisma(ch) > GetSkillLevel(ch, gsn_seduce))
    {
        ch->Echo("You failed.\r\n");
        sprintf(buf, "%s failed to seduce you.", ch->Name.c_str());
        victim->Echo("%s", buf);
        global_retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
        return;
    }


    if(victim->Master)
        StopFollowing(victim);

    LearnFromSuccess(ch, gsn_seduce);
    StartFollowing(victim, ch);
}
