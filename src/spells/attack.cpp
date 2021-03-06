#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

/*
 * Generic offensive spell damage attack                        -Thoric
 */
ch_ret spell_attack(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    std::shared_ptr<Skill> skill = GetSkill(sn);
    bool saved = CheckSavingThrow(sn, level, ch, victim);
    int dam = 0;
    ch_ret retcode = rNONE;

    ch->Echo("You feel the hatred grow within you!\r\n");
    ch->Alignment -= 100;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);

    if(saved && !SPELL_FLAG(skill, SF_SAVE_HALF_DAMAGE))
    {
        FailedCasting(skill, ch, victim, NULL);
        return rSPELL_FAILED;
    }

    if(!skill->Dice.empty())
        dam = umax(0, ParseDice(ch, level, skill->Dice));
    else
        dam = RollDice(1, level);

    if(saved)
        dam /= 2;

    if(IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(ch))
        dam -= (int)(dam / 4);

    retcode = InflictDamage(ch, victim, dam, sn);

    if(retcode == rNONE && !skill->Affects.empty()
       && !CharacterDiedRecently(ch) && !CharacterDiedRecently(victim))
        retcode = spell_affectchar(sn, level, ch, victim);

    return retcode;
}
