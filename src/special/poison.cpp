#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

bool spec_poison(std::shared_ptr<Character> mob)
{
    std::shared_ptr<Character> victim = WhoFighting(mob);
    int chanceOfBiting = mob->TopLevel() * 2;

    if (mob->Position == POS_FIGHTING
        && victim != nullptr
        && GetRandomPercent() <= chanceOfBiting)
    {
        Act(AT_HIT, "You bite $N!", mob, nullptr, victim, ActTarget::Char);
        Act(AT_ACTION, "$n bites $N!", mob, nullptr, victim, ActTarget::NotVict);
        Act(AT_POISON, "$n bites you!", mob, nullptr, victim, ActTarget::Vict);
        spell_poison(gsn_poison, mob->TopLevel(), mob, victim);

        return true;
    }
    else
    {
        return false;
    }
}

