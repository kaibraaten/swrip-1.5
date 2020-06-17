#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_cause_critical(int sn, int level, Character* ch, const Vo &vo)
{
    ch->Echo("You feel the hatred grow within you!\r\n");
    ch->Alignment -= 70;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);

    return InflictDamage(ch, vo.Ch, RollDice(3, 8) + level, sn);
}

