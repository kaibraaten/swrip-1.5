#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"
#include "triggers.hpp"

void do_eat(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Object> obj;
    ch_ret retcode = rNONE;
    int foodcond = 0;

    if(argument.empty())
    {
        ch->Echo("Eat what?\r\n");
        return;
    }

    if(IsNpc(ch) || ch->PCData->Condition[COND_FULL] > 5)
        if(HasMentalStateToFindObject(ch))
            return;

    if((obj = FindObject(ch, argument, true)) == NULL)
        return;

    if(!IsImmortal(ch))
    {
        if(obj->ItemType != ITEM_FOOD && obj->ItemType != ITEM_PILL)
        {
            Act(AT_ACTION, "$n starts to nibble on $p... ($e must really be hungry)",
                ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You try to nibble on $p...",
                ch, obj, NULL, ActTarget::Char);
            return;
        }

        if(!IsNpc(ch) && ch->PCData->Condition[COND_FULL] > 40)
        {
            ch->Echo("You are too full to eat more.\r\n");
            return;
        }
    }

    /* required due to object grouping */
    SeparateOneObjectFromGroup(obj);
    SetWaitState(ch, PULSE_PER_SECOND / 2);

    if(obj->InObject)
    {
        Act(AT_PLAIN, "You take $p from $P.", ch, obj, obj->InObject, ActTarget::Char);
        Act(AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->InObject, ActTarget::Room);
    }

    if(!ObjProgUseTrigger(ch, obj))
    {
        if(obj->ActionDescription.empty())
        {
            Act(AT_ACTION, "$n eats $p.", ch, obj, nullptr, ActTarget::Room);
            Act(AT_ACTION, "You eat $p.", ch, obj, nullptr, ActTarget::Char);
        }
        else
        {
            ActionDescription(ch, obj);
        }
    }

    switch(obj->ItemType)
    {
    case ITEM_FOOD:
        if(obj->Timer > 0 && obj->Value[OVAL_FOOD_MAX_CONDITION] > 0)
            foodcond = (obj->Timer * 10) / obj->Value[OVAL_FOOD_MAX_CONDITION];
        else
            foodcond = 10;

        if(!IsNpc(ch))
        {
            int condition = ch->PCData->Condition[COND_FULL];

            GainCondition(ch, COND_FULL, (obj->Value[OVAL_FOOD_SATISFACTION] * foodcond) / 10);

            if(condition <= 1 && ch->PCData->Condition[COND_FULL] > 1)
                ch->Echo("You are no longer hungry.\r\n");
            else if(ch->PCData->Condition[COND_FULL] > 40)
                ch->Echo("You are full.\r\n");
        }

        if(obj->Value[OVAL_FOOD_POISON] != 0
           || (foodcond < 4 && GetRandomNumberFromRange(0, foodcond + 1) == 0))
        {
            /* The food was poisoned! */
            if(obj->Value[OVAL_FOOD_POISON] != 0)
            {
                Act(AT_POISON, "$n chokes and gags.", ch, NULL, NULL, ActTarget::Room);
                Act(AT_POISON, "You choke and gag.", ch, NULL, NULL, ActTarget::Char);
                ch->MentalState = urange(20, ch->MentalState + 5, 100);
            }
            else
            {
                Act(AT_POISON, "$n gags on $p.", ch, obj, NULL, ActTarget::Room);
                Act(AT_POISON, "You gag on $p.", ch, obj, NULL, ActTarget::Char);
                ch->MentalState = urange(15, ch->MentalState + 5, 100);
            }

            std::shared_ptr<Affect> af = std::make_shared<Affect>();
            af->Type = gsn_poison;
            af->Duration = 2 * obj->Value[OVAL_FOOD_SATISFACTION] * (obj->Value[OVAL_FOOD_POISON] > 0 ? obj->Value[OVAL_FOOD_POISON] : 1);
            af->Location = APPLY_NONE;
            af->Modifier = 0;
            af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Poison });
            JoinAffect(ch, af);
        }
        break;

    case ITEM_PILL:
        /* allow pills to fill you, if so desired */
        if(!IsNpc(ch) && obj->Value[OVAL_PILL_SATISFACTION])
        {
            int condition = ch->PCData->Condition[COND_FULL];
            GainCondition(ch, COND_FULL, obj->Value[4]);

            if(condition <= 1 && ch->PCData->Condition[COND_FULL] > 1)
                ch->Echo("You are no longer hungry.\r\n");
            else if(ch->PCData->Condition[COND_FULL] > 40)
                ch->Echo("You are full.\r\n");
        }

        retcode = CastSpellWithObject(obj->Value[OVAL_PILL_SPELL1], obj->Value[OVAL_PILL_LEVEL], ch, ch, NULL);

        if(retcode == rNONE)
            retcode = CastSpellWithObject(obj->Value[OVAL_PILL_SPELL2], obj->Value[OVAL_PILL_LEVEL], ch, ch, NULL);

        if(retcode == rNONE)
            retcode = CastSpellWithObject(obj->Value[OVAL_PILL_SPELL3], obj->Value[OVAL_PILL_LEVEL], ch, ch, NULL);

        break;

    default:
        break;
    }

    if(obj->Serial == cur_obj)
        global_objcode = rOBJ_EATEN;

    ExtractObject(obj);
}
