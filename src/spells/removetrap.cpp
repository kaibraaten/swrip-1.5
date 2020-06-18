#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "object.hpp"

extern std::string spell_target_name;

ch_ret spell_remove_trap(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Object> obj;
    std::shared_ptr<Object> trap;
    bool found = false;
    int retcode = rNONE;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if(spell_target_name.empty())
    {
        ch->Echo("Remove trap on what?\r\n");
        return rSPELL_FAILED;
    }

    found = false;

    if(ch->InRoom->Objects().empty())
    {
        ch->Echo("You can't find that here.\r\n");
        return rNONE;
    }

    for(auto i = std::begin(ch->InRoom->Objects()); i != std::end(ch->InRoom->Objects()); ++i)
    {
        obj = *i;

        if(CanSeeObject(ch, obj) && NiftyIsName(spell_target_name, obj->Name))
        {
            found = true;
            break;
        }
    }

    if(!found)
    {
        ch->Echo("You can't find that here.\r\n");
        return rSPELL_FAILED;
    }

    if((trap = GetTrap(obj)) == NULL)
    {
        FailedCasting(skill, ch, NULL, NULL);
        return rSPELL_FAILED;
    }


    if(Chance(ch, 70 + GetCurrentWisdom(ch)))
    {
        ch->Echo("Ooops!\r\n");
        retcode = SpringTrap(ch, trap);
        if(retcode == rNONE)
            retcode = rSPELL_FAILED;
        return retcode;
    }

    ExtractObject(trap);

    SuccessfulCasting(skill, ch, NULL, NULL);
    return rNONE;
}

