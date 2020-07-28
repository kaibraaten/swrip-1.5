#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"

extern std::string spell_target_name;

ch_ret spell_sleep(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    int retcode = rNONE;
    int sleep_chance = 0;
    int tmp = 0;
    std::shared_ptr<Character> victim;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if((victim = GetCharacterInRoom(ch, spell_target_name)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return rSPELL_FAILED;
    }

    if(!IsNpc(victim) && IsFighting(victim))
    {
        ch->Echo("You cannot sleep a fighting player.\r\n");
        return rSPELL_FAILED;
    }

    if(IsSafe(ch, victim))
        return rSPELL_FAILED;

    if(victim->Immune.test(Flag::Ris::Magic))
    {
        ImmuneCasting(skill, ch, victim, nullptr);
        return rSPELL_FAILED;
    }

    if(SPELL_FLAG(skill, SF_PKSENSITIVE)
       && !IsNpc(ch) && !IsNpc(victim))
        tmp = level;
    else
        tmp = level;

    if(IsAffectedBy(victim, Flag::Affect::Sleep)
       || (sleep_chance = ModifySavingThrowBasedOnResistance(victim, tmp, Flag::Ris::Sleep)) == 1000
       || (victim != ch && victim->InRoom->Flags.test(Flag::Room::Safe))
       || SaveVsSpellStaff(sleep_chance, victim))
    {
        FailedCasting(skill, ch, victim, NULL);

        if(ch == victim)
            return rSPELL_FAILED;

        if(!IsFighting(victim))
        {
            retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);

            if(retcode == rNONE)
                retcode = rSPELL_FAILED;

            return retcode;
        }
    }

    af->Type = sn;
    af->Duration = (4 + level) * DUR_CONV;
    af->Location = APPLY_NONE;
    af->Modifier = 0;
    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Sleep });
    JoinAffect(victim, af);

    /* Added by Narn at the request of Dominus. */
    if(!IsNpc(victim))
    {
        auto logBuf = FormatString("%s has cast sleep on %s.",
                                   ch->Name.c_str(), victim->Name.c_str());
        Log->LogStringPlus(logBuf, LogType::Normal, ch->TopLevel());
        ToChannel(logBuf, CHANNEL_MONITOR, "Monitor", umax(LEVEL_IMMORTAL, ch->TopLevel()));
    }

    if(IsAwake(victim) && !IsDroid(victim))
    {
        Act(AT_MAGIC, "You feel very sleepy ..... zzzzzz.", victim, NULL, NULL, ActTarget::Char);
        Act(AT_MAGIC, "$n goes to sleep.", victim, NULL, NULL, ActTarget::Room);
        victim->Position = POS_SLEEPING;
    }
    else if(IsAwake(victim) && IsDroid(victim))
    {
        Act(AT_MAGIC, "You feel a jolt as you are deactivated.", victim, NULL, NULL, ActTarget::Char);
        Act(AT_MAGIC, "$n shutsdown.", victim, NULL, NULL, ActTarget::Room);
        victim->Position = POS_SLEEPING;
    }

    if(IsNpc(victim))
    {
        StartHating(victim, ch);
    }

    return rNONE;
}

