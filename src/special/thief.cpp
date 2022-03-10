#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "act.hpp"

bool spec_thief(std::shared_ptr<Character> mob)
{
    if (mob->Position != POS_STANDING)
    {
        return false;
    }

    for (auto victim : RandomizeOrder(mob->InRoom->Characters()))
    {
        if (GetTrustLevel(victim) >= LEVEL_IMMORTAL
            || NumberBits(2) != 0
            || !CanSeeCharacter(mob, victim))
        {        /* Thx Glop */
            continue;
        }

        if (IsAwake(victim) && GetRandomNumberFromRange(0, mob->TopLevel()) == 0)
        {
            Act(AT_ACTION, "You discover $n's hands in your wallet!",
                mob, nullptr, victim, ActTarget::Vict);
            Act(AT_ACTION, "$N discovers $n's hands in $S wallet!",
                mob, nullptr, victim, ActTarget::NotVict);
            return true;
        }
        else
        {
            constexpr long maxgold = 1'000;
            long gold = victim->Gold * GetRandomNumberFromRange(1, urange(2, mob->TopLevel() / 4, 10)) / 100;
            mob->Gold += 9 * gold / 10;
            victim->Gold -= gold;

            if (mob->Gold > maxgold)
            {
                BoostEconomy(mob->InRoom->Area, mob->Gold - maxgold / 2);
                mob->Gold = maxgold / 2;
            }
            return true;
        }
    }

    return false;
}
