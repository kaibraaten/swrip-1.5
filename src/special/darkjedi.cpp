#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

bool spec_dark_jedi(std::shared_ptr<Character> mob)
{
    std::shared_ptr<Character> victim;
    std::string spell;
    int sn = 0;

    if (!IsFighting(mob))
    {
        return false;
    }

    for (auto fighter : mob->InRoom->Characters())
    {
        if (IsFighting(fighter) && NumberBits(2) == 0)
        {
            victim = fighter;
            break;
        }
    }

    if (!victim || victim == mob)
    {
        return false;
    }

    for (;;)
    {
        int min_level = 0;

        switch (NumberBits(4))
        {
            case 0:
                min_level = 5;
                spell = "blindness";
                break;

            case 2:
                min_level = 9;
                spell = "choke";
                break;

            case 3:
                min_level = 8;
                spell = "invade essence";
                break;

            case 6:
                min_level = 13;
                spell = "drain essence";
                break;

            case 8:
                min_level = 13;
                spell = "harm";
                break;

            case 9:
                min_level = 9;
                spell = "force bolt";
                break;

            case 10:
                min_level = 1;
                spell = "force spray";
                break;

            default:
                return false;
        }

        if (mob->TopLevel() >= min_level)
        {
            break;
        }
    }

    if ((sn = LookupSkill(spell)) < 0)
    {
        return false;
    }

    SkillTable[sn]->SpellFunction(sn, mob->TopLevel(), mob, victim);

    return true;
}

