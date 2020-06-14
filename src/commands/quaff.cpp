#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "systemdata.hpp"
#include "act.hpp"

void do_quaff(Character *ch, std::string argument)
{
    Object *obj = NULL;
    ch_ret retcode = rNONE;

    if(argument.empty())
    {
        ch->Echo("Quaff what?\r\n");
        return;
    }

    if((obj = FindObject(ch, argument, true)) == NULL)
        return;

    if(obj->ItemType != ITEM_POTION)
    {
        if(obj->ItemType == ITEM_DRINK_CON)
            do_drink(ch, obj->Name);
        else
        {
            Act(AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, ActTarget::Char);
        }
        return;
    }

    /*
     * Fullness checking                                  -Thoric
     */
    if(!IsNpc(ch)
       && (ch->PCData->Condition[COND_FULL] >= 48
           || ch->PCData->Condition[COND_THIRST] >= 48))
    {
        ch->Echo("Your stomach cannot contain any more.\r\n");
        return;
    }

    SeparateOneObjectFromGroup(obj);

    if(obj->InObject)
    {
        Act(AT_PLAIN, "You take $p from $P.", ch, obj, obj->InObject, ActTarget::Char);
        Act(AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->InObject, ActTarget::Room);
    }

    /*
     * If fighting, chance of dropping potion                     -Thoric
     */
    if(ch->Fighting && GetRandomPercent() > (GetCurrentDexterity(ch) * 2 + 48))
    {
        Act(AT_MAGIC, "$n accidentally drops $p and it smashes into a thousand fragments.",
            ch, obj, NULL, ActTarget::Room);
        Act(AT_MAGIC, "Oops... $p gets knocked from your hands and smashes into pieces!",
            ch, obj, NULL, ActTarget::Char);
    }
    else
    {
        if(!ObjProgUseTrigger(ch, obj, NULL, NULL, NULL))
        {
            Act(AT_ACTION, "$n quaffs $p.", ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You quaff $p.", ch, obj, NULL, ActTarget::Char);
        }

        SetWaitState(ch, PULSE_PER_SECOND / 4);

        GainCondition(ch, COND_THIRST, 1);
        retcode = CastSpellWithObject(obj->Value[1], obj->Value[0], ch, ch, NULL);

        if(retcode == rNONE)
            retcode = CastSpellWithObject(obj->Value[2], obj->Value[0], ch, ch, NULL);

        if(retcode == rNONE)
            retcode = CastSpellWithObject(obj->Value[3], obj->Value[0], ch, ch, NULL);
    }

    if(cur_obj == obj->Serial)
        global_objcode = rOBJ_QUAFFED;

    ExtractObject(obj);
}
