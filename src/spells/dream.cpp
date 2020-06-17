#include "character.hpp"
#include "mud.hpp"

extern std::string spell_target_name;

ch_ret spell_dream(int sn, int level, Character *ch, const Vo &vo)
{
    Character *victim;
    std::string arg;

    spell_target_name = OneArgument(spell_target_name, arg);
    SetCharacterColor(AT_MAGIC, ch);

    if(!(victim = GetCharacterAnywhere(ch, arg)))
    {
        ch->Echo("They aren't here.\r\n");
        return rSPELL_FAILED;
    }
    if(victim->Position != POS_SLEEPING)
    {
        ch->Echo("They aren't asleep.\r\n");
        return rSPELL_FAILED;
    }
    if(IsDroid(victim))
    {
        ch->Echo("Machines do not dream.\r\n");
        return rSPELL_FAILED;
    }

    if(spell_target_name.empty())
    {
        ch->Echo("What do you want them to dream about?\r\n");
        return rSPELL_FAILED;
    }

    SetCharacterColor(AT_TELL, victim);
    victim->Echo("You have dreams about %s telling you '%s'.\r\n",
                 PERS(ch, victim).c_str(), spell_target_name.c_str());
    ch->Echo("Ok.\r\n");
    return rNONE;
}

