#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

bool spec_guardian(std::shared_ptr<Character> mob)
{
    char buf[MAX_STRING_LENGTH];
    const char *crime = "disturber of the peace";
    int max_evil = 300;
    std::shared_ptr<Character> victim;

    if (!IsAwake(mob) || IsFighting(mob))
    {
        return false;
    }

    for (auto ech : mob->InRoom->Characters())
    {
        if (IsFighting(ech)
            && WhoFighting(ech) != mob
            && ech->Alignment < max_evil)
        {
            max_evil = ech->Alignment;
            victim = ech;
            break;
        }
    }

    if (victim)
    {
        if (mob->InRoom->Flags.test(Flag::Room::Safe))
        {
            sprintf(buf, "%s is a %s! As well as a COWARD!",
                    victim->Name.c_str(), crime);
            do_yell(mob, buf);
            return true;
        }
        else
        {
            sprintf(buf, "%s is a %s! PROTECT THE INNOCENT!!",
                    victim->Name.c_str(), crime);
            do_shout(mob, buf);
            HitMultipleTimes(mob, victim, TYPE_UNDEFINED);
            return true;
        }
    }

    return false;
}
