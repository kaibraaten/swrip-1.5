#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"

ch_ret spell_cause_light(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 50;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    return InflictDamage(caster, vo.Ch, RollDice(1, 8) + level / 3, sn);
}

