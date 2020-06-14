#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"

void do_arm(Character *ch, std::string argument)
{
    Object *obj = nullptr;

    if(IsNpc(ch) || !ch->PCData)
    {
        ch->Echo("Mob's cant do that!\r\n");
        return;
    }

    if(ch->PCData->Learned[gsn_grenades] <= 0)
    {
        ch->Echo("You have no idea how to do that.\r\n");
        return;
    }

    obj = GetEquipmentOnCharacter(ch, WEAR_HOLD);

    if(!obj || obj->ItemType != ITEM_GRENADE)
    {
        ch->Echo("You don't seem to be holding a grenade!\r\n");
        return;
    }

    obj->Timer = 1;
    obj->ArmedBy = ch->Name;

    ch->Echo("You arm %s.\r\n", obj->ShortDescr.c_str());
    Act(AT_PLAIN, "$n arms $p.", ch, obj, NULL, ActTarget::Room);

    LearnFromSuccess(ch, gsn_grenades);
}

