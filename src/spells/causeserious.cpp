#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"

ch_ret spell_cause_serious(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment -= 90;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    return InflictDamage(caster, vo.Ch, RollDice(level, 2), sn);
}

