#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"

ch_ret spell_shocking_grasp(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    constexpr int dam_each[] =
            {
                    1,
                    2, 4, 6, 8, 10, 15, 20, 25, 29, 33,
                    36, 39, 39, 39, 40, 40, 41, 41, 42, 42,
                    43, 43, 44, 44, 45, 45, 46, 46, 47, 47,
                    48, 48, 49, 49, 50, 50, 51, 51, 52, 52,
                    53, 53, 54, 54, 55, 55, 56, 56, 57, 57,
                    58, 58, 59, 59, 60, 60, 61, 61, 62, 62,
                    63, 63, 64, 64, 65, 65, 66, 66, 67, 67
            };

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);


    level = umin(level, sizeof(dam_each) / sizeof(dam_each[0]) - 1);
    level = umax(0, level);
    int dam = GetRandomNumberFromRange(dam_each[level] / 2, dam_each[level] * 2);

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

