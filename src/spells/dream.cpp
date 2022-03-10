#include "character.hpp"
#include "mud.hpp"

extern std::string spell_target_name;

ch_ret spell_dream(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim;
    std::string arg;

    spell_target_name = OneArgument(spell_target_name, arg);
    SetCharacterColor(AT_MAGIC, caster);

    if (!(victim = GetCharacterAnywhere(caster, arg)))
    {
        caster->Echo("They aren't here.\r\n");
        return rSPELL_FAILED;
    }
    else if (victim->Position != POS_SLEEPING)
    {
        caster->Echo("They aren't asleep.\r\n");
        return rSPELL_FAILED;
    }
    else if (IsDroid(victim))
    {
        caster->Echo("Machines do not dream.\r\n");
        return rSPELL_FAILED;
    }
    else if (spell_target_name.empty())
    {
        caster->Echo("What do you want them to dream about?\r\n");
        return rSPELL_FAILED;
    }

    SetCharacterColor(AT_TELL, victim);
    victim->Echo("You have dreams about %s telling you '%s'.\r\n",
                 PERS(caster, victim).c_str(), spell_target_name.c_str());
    caster->Echo("Ok.\r\n");
    return rNONE;
}

