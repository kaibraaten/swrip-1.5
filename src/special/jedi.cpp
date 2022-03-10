#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

bool spec_jedi(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob) || IsFighting(mob))
    {
        return false;
    }

    auto victim = Find(mob->InRoom->Characters(),
                       [mob](const auto &potentialVictim)
                       {
                           return potentialVictim != mob && CanSeeCharacter(mob, potentialVictim) && NumberBits(1) == 0;
                       });

    if (!victim)
    {
        return false;
    }

    switch (NumberBits(3))
    {
        case 0:
            spell_smaug(LookupSkill("armor"), mob->TopLevel(), mob, victim);
            return true;

        case 1:
            spell_smaug(LookupSkill("alertness"), mob->TopLevel(), mob, victim);
            return true;

        case 2:
            spell_cure_blindness(LookupSkill("cure blindness"),
                                 mob->TopLevel(), mob, victim);
            return true;

        case 3:
            spell_smaug(LookupSkill("cure light"),
                        mob->TopLevel(), mob, victim);
            return true;

        case 4:
            spell_cure_poison(LookupSkill("cure poison"),
                              mob->TopLevel(), mob, victim);
            return true;

        case 5:
            spell_smaug(LookupSkill("refresh"), mob->TopLevel(), mob, victim);
            return true;

        case 6:
            spell_smaug(LookupSkill("cure serious"), mob->TopLevel(), mob, victim);
            return true;

        case 7:
            spell_smaug(LookupSkill("beauty"), mob->TopLevel(), mob, victim);
            return true;
    }

    return false;
}

