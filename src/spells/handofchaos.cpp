#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"

ch_ret spell_hand_of_chaos(int sn, int level, Character* ch, void* vo)
{
    Character* victim = (Character*)vo;
    int dam = 0;

    level = umax(0, level);
    dam = level * GetRandomNumberFromRange(1, 7) + 9;

    ch->Echo("You feel the hatred grow within you!\r\n");
    ch->Alignment = ch->Alignment - 100;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);


    if (SaveVsSpellStaff(level, victim))
        dam = 0;

    Act(AT_MAGIC, "$N is grasped by an incomprehensible hand of darkness!"
        , ch, NULL,
        victim, TO_NOTVICT);
    return InflictDamage(ch, victim, dam, sn);
}

