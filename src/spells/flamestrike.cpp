#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"

ch_ret spell_flamestrike(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    int dam = 0;

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    dam = RollDice(6, 8);

    if (SaveVsSpellStaff(level, victim))
    {
        dam /= 2;
    }

    if (IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(caster))
    {
        dam -= (int) (dam / 4);
    }

    return InflictDamage(caster, victim, dam, sn);
}

