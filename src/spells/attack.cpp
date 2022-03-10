#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

/*
 * Generic offensive spell damage attack                        -Thoric
 */
ch_ret spell_attack(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    std::shared_ptr<Skill> skill = GetSkill(sn);
    bool saved = CheckSavingThrow(sn, level, caster, victim);
    int dam = 0;
    ch_ret retcode = rNONE;

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment -= 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    if (saved && !SPELL_FLAG(skill, SF_SAVE_HALF_DAMAGE))
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    if (!skill->Dice.empty())
    {
        dam = umax(0, ParseDice(caster, level, skill->Dice));
    }
    else
    {
        dam = RollDice(1, level);
    }

    if (saved)
    {
        dam /= 2;
    }

    if (IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(caster))
    {
        dam -= (int) (dam / 4);
    }

    retcode = InflictDamage(caster, victim, dam, sn);

    if (retcode == rNONE && !skill->Affects.empty()
        && !CharacterDiedRecently(caster) && !CharacterDiedRecently(victim))
    {
        retcode = spell_affectchar(sn, level, caster, victim);
    }

    return retcode;
}
