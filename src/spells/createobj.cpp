#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"

/*
 * Generic object creating spell                                -Thoric
 */
ch_ret spell_create_obj(int sn, int level, Character *ch, void *vo)
{
    Skill *skill = GetSkill(sn);
    int lvl = 0;
    int vnum = skill->Value;
    Object *obj = nullptr;
    std::shared_ptr<ProtoObject> oi;

    switch (SPELL_POWER(skill))
    {
    default:
    case SP_NONE:        lvl = 10;      break;
    case SP_MINOR:       lvl = 0;       break;
    case SP_GREATER: lvl = level / 2; break;
    case SP_MAJOR:       lvl = level;   break;
    }

    if ((oi = GetProtoObject(vnum)) == NULL
        || (obj = CreateObject(oi, lvl)) == NULL)
    {
        FailedCasting(skill, ch, NULL, NULL);
        return rNONE;
    }

    obj->Timer = !skill->Dice.empty() ? ParseDice(ch, level, skill->Dice) : 0;
    SuccessfulCasting(skill, ch, NULL, obj);

    if (IsBitSet(obj->WearFlags, ITEM_TAKE))
        ObjectToCharacter(obj, ch);
    else
        ObjectToRoom(obj, ch->InRoom);

    return rNONE;
}

