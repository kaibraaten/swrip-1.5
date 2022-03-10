#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "act.hpp"

bool spec_jedi_healer(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob))
    {
        return false;
    }

    std::shared_ptr<Character> victim = Find(mob->InRoom->Characters(),
                                             [mob](const auto &potentialVictim)
                                             {
                                                 return potentialVictim != mob && CanSeeCharacter(mob, potentialVictim)
                                                        && NumberBits(1) == 0;
                                             });

    if (!victim)
    {
        return false;
    }

    switch (NumberBits(12))
    {
        case 0:
            Act(AT_MAGIC, "$n pauses and concentrates for a moment.", mob, nullptr, nullptr, ActTarget::Room);
            spell_smaug(LookupSkill("armor"), mob->TopLevel(), mob, victim);
            return true;

        case 1:
            Act(AT_MAGIC, "$n pauses and concentrates for a moment.", mob, nullptr, nullptr, ActTarget::Room);
            spell_smaug(LookupSkill("good fortune"), mob->TopLevel(), mob, victim);
            return true;

        case 2:
            Act(AT_MAGIC, "$n pauses and concentrates for a moment.", mob, nullptr, nullptr, ActTarget::Room);
            spell_cure_blindness(LookupSkill("cure blindness"),
                                 mob->TopLevel(), mob, victim);
            return true;

        case 3:
            Act(AT_MAGIC, "$n pauses and concentrates for a moment.", mob, nullptr, nullptr, ActTarget::Room);
            spell_smaug(LookupSkill("cure light"),
                        mob->TopLevel(), mob, victim);
            return true;

        case 4:
            Act(AT_MAGIC, "$n pauses and concentrates for a moment.", mob, nullptr, nullptr, ActTarget::Room);
            spell_cure_poison(LookupSkill("cure poison"),
                              mob->TopLevel(), mob, victim);
            return true;

        case 5:
            Act(AT_MAGIC, "$n pauses and concentrates for a moment.", mob, nullptr, nullptr, ActTarget::Room);
            spell_smaug(LookupSkill("refresh"), mob->TopLevel(), mob, victim);
            return true;
    }

    return false;
}
