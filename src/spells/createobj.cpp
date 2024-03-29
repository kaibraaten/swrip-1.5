#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"

/*
 * Generic object creating spell                                -Thoric
 */
ch_ret spell_create_obj(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);
    int lvl = 0;
    vnum_t vnum = skill->Value;
    std::shared_ptr<Object> obj;
    std::shared_ptr<ProtoObject> oi;

    switch (SPELL_POWER(skill))
    {
        default:
        case SP_NONE:
            lvl = 10;
            break;

        case SP_MINOR:
            lvl = 0;
            break;

        case SP_GREATER:
            lvl = level / 2;
            break;

        case SP_MAJOR:
            lvl = level;
            break;
    }

    if ((oi = GetProtoObject(vnum)) == NULL
        || (obj = CreateObject(oi, lvl)) == NULL)
    {
        FailedCasting(skill, caster, NULL, NULL);
        return rNONE;
    }

    obj->Timer = !skill->Dice.empty() ? ParseDice(caster, level, skill->Dice) : 0;
    SuccessfulCasting(skill, caster, NULL, obj);

    if (obj->WearFlags.test(Flag::Wear::Take))
    {
        ObjectToCharacter(obj, caster);
    }
    else
    {
        ObjectToRoom(obj, caster->InRoom);
    }

    return rNONE;
}

