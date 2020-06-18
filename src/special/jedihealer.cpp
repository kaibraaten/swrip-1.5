#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "act.hpp"

bool spec_jedi_healer(std::shared_ptr<Character> ch)
{
    std::shared_ptr<Character> victim;

    if(!IsAwake(ch))
        return false;

    for(auto potentialVictim : ch->InRoom->Characters())
    {
        if(potentialVictim != ch
           && CanSeeCharacter(ch, potentialVictim) && NumberBits(1) == 0)
        {
            victim = potentialVictim;
            break;
        }
    }

    if(!victim)
        return false;

    switch(NumberBits(12))
    {
    case 0:
        Act(AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, ActTarget::Room);
        spell_smaug(LookupSkill("armor"), ch->TopLevel, ch, victim);
        return true;

    case 1:
        Act(AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, ActTarget::Room);
        spell_smaug(LookupSkill("good fortune"), ch->TopLevel, ch, victim);
        return true;

    case 2:
        Act(AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, ActTarget::Room);
        spell_cure_blindness(LookupSkill("cure blindness"),
                             ch->TopLevel, ch, victim);
        return true;

    case 3:
        Act(AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, ActTarget::Room);
        spell_smaug(LookupSkill("cure light"),
                    ch->TopLevel, ch, victim);
        return true;

    case 4:
        Act(AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, ActTarget::Room);
        spell_cure_poison(LookupSkill("cure poison"),
                          ch->TopLevel, ch, victim);
        return true;

    case 5:
        Act(AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, ActTarget::Room);
        spell_smaug(LookupSkill("refresh"), ch->TopLevel, ch, victim);
        return true;
    }

    return false;
}
