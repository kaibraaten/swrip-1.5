#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

ch_ret spell_detect_poison(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Object> obj = vo.Obj;

    SetCharacterColor(AT_MAGIC, caster);

    if (obj->ItemType == ITEM_DRINK_CON || obj->ItemType == ITEM_FOOD)
    {
        if (obj->Value[OVAL_FOOD_POISON] != 0)
        {
            caster->Echo("You smell poisonous fumes.\r\n");
        }
        else
        {
            caster->Echo("It looks very delicious.\r\n");
        }
    }
    else
    {
        caster->Echo("It doesn't look poisoned.\r\n");
    }

    return rNONE;
}

