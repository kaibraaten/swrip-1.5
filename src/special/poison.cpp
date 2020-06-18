#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

bool spec_poison(std::shared_ptr<Character> ch)
{
    Character *victim = nullptr;

    if(ch->Position != POS_FIGHTING
       || (victim = GetFightingOpponent(ch)) == NULL
       || GetRandomPercent() > 2 * ch->TopLevel)
        return false;

    Act(AT_HIT, "You bite $N!", ch, NULL, victim, ActTarget::Char);
    Act(AT_ACTION, "$n bites $N!", ch, NULL, victim, ActTarget::NotVict);
    Act(AT_POISON, "$n bites you!", ch, NULL, victim, ActTarget::Vict);
    spell_poison(gsn_poison, ch->TopLevel, ch, victim);

    return true;
}

