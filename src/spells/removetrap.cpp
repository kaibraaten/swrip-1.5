#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "object.hpp"

extern std::string spell_target_name;

ch_ret spell_remove_trap(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    int retcode = rNONE;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (spell_target_name.empty())
    {
        caster->Echo("Remove trap on what?\r\n");
        return rSPELL_FAILED;
    }


    if (caster->InRoom->Objects().empty())
    {
        caster->Echo("You can't find that here.\r\n");
        return rNONE;
    }

    auto obj = Find(caster->InRoom->Objects(),
                    [&](const auto &o)
                    {
                        return CanSeeObject(caster, o) && NiftyIsName(spell_target_name, o->Name);
                    });

    if (obj == nullptr)
    {
        caster->Echo("You can't find that here.\r\n");
        return rSPELL_FAILED;
    }

    auto trap = GetTrap(obj);

    if (trap == nullptr)
    {
        FailedCasting(skill, caster, nullptr, nullptr);
        return rSPELL_FAILED;
    }

    if (Chance(caster, 70 + GetCurrentWisdom(caster)))
    {
        caster->Echo("Ooops!\r\n");
        retcode = SpringTrap(caster, trap);

        if (retcode == rNONE)
        {
            retcode = rSPELL_FAILED;
        }

        return retcode;
    }

    ExtractObject(trap);
    SuccessfulCasting(skill, caster, nullptr, nullptr);
    return rNONE;
}
