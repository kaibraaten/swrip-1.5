#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

ch_ret spell_hand_of_chaos(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;

    level = umax(0, level);
    int dam = level * GetRandomNumberFromRange(1, 7) + 9;

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    if (SaveVsSpellStaff(level, victim))
    {
        dam = 0;
    }

    Act(AT_MAGIC, "$N is grasped by an incomprehensible hand of darkness!", caster, NULL,
        victim, ActTarget::NotVict);
    return InflictDamage(caster, victim, dam, sn);
}
