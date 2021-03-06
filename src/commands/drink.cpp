#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"
#include "triggers.hpp"

static std::shared_ptr<Object> FindFountain(std::shared_ptr<Room> location);

void do_drink(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Object> obj;
    int liquid = 0;

    argument = OneArgument(argument, arg);

    /* munch optional words */
    if(!StrCmp(arg, "from") && !argument.empty())
        argument = OneArgument(argument, arg);

    if(arg.empty())
    {
        obj = FindFountain(ch->InRoom);

        if(!obj)
        {
            ch->Echo("Drink what?\r\n");
            return;
        }
    }
    else if((obj = GetObjectHere(ch, arg)) == NULL)
    {
        ch->Echo("You can't find it.\r\n");
        return;
    }

    if(obj->Count > 1 && obj->ItemType != ITEM_FOUNTAIN)
        SeparateOneObjectFromGroup(obj);

    if(!IsNpc(ch) && ch->PCData->Condition[COND_DRUNK] > 40)
    {
        ch->Echo("You fail to reach your mouth. *Hic*\r\n");
        return;
    }

    switch(obj->ItemType)
    {
    default:
        if(obj->CarriedBy == ch)
        {
            Act(AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...",
                ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You bring $p up to your mouth and try to drink from it...",
                ch, obj, NULL, ActTarget::Char);
        }
        else
        {
            Act(AT_ACTION, "$n gets down and tries to drink from $p... (Is $e feeling ok?)",
                ch, obj, NULL, ActTarget::Room);
            Act(AT_ACTION, "You get down on the ground and try to drink from $p...",
                ch, obj, NULL, ActTarget::Char);
        }
        break;

    case ITEM_POTION:
        if(obj->CarriedBy == ch)
            do_quaff(ch, obj->Name);
        else
            ch->Echo("You're not carrying that.\r\n");
        break;

    case ITEM_FOUNTAIN:
        if(!ObjProgUseTrigger(ch, obj))
        {
            Act(AT_ACTION, "$n drinks from the fountain.", ch, NULL, NULL, ActTarget::Room);
            ch->Echo("You take a long thirst quenching drink.\r\n");
        }

        if(!IsNpc(ch))
            ch->PCData->Condition[COND_THIRST] = 40;
        break;

    case ITEM_DRINK_CON:
        if(obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] <= 0)
        {
            ch->Echo("It is already empty.\r\n");
            return;
        }

        if((liquid = obj->Value[OVAL_DRINK_CON_LIQUID_TYPE]) >= LIQ_MAX)
        {
            Log->Bug("Do_drink: bad liquid number %d.", liquid);
            liquid = obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = LIQ_WATER;
        }

        if(!ObjProgUseTrigger(ch, obj))
        {
            Act(AT_ACTION, "$n drinks $T from $p.",
                ch, obj, std::string(LiquidTable[liquid].Name), ActTarget::Room);
            Act(AT_ACTION, "You drink $T from $p.",
                ch, obj, std::string(LiquidTable[liquid].Name), ActTarget::Char);
        }

        GainCondition(ch, COND_DRUNK,
                      LiquidTable[liquid].Affect[COND_DRUNK]);
        GainCondition(ch, COND_FULL,
                      LiquidTable[liquid].Affect[COND_FULL]);
        GainCondition(ch, COND_THIRST,
                      LiquidTable[liquid].Affect[COND_THIRST]);

        if(!IsNpc(ch))
        {
            if(ch->PCData->Condition[COND_DRUNK] > 24)
                ch->Echo("You feel quite sloshed.\r\n");
            else if(ch->PCData->Condition[COND_DRUNK] > 18)
                ch->Echo("You feel very drunk.\r\n");
            else if(ch->PCData->Condition[COND_DRUNK] > 12)
                ch->Echo("You feel drunk.\r\n");
            else if(ch->PCData->Condition[COND_DRUNK] > 8)
                ch->Echo("You feel a little drunk.\r\n");
            else if(ch->PCData->Condition[COND_DRUNK] > 5)
                ch->Echo("You feel light headed.\r\n");

            if(ch->PCData->Condition[COND_FULL] > 40)
                ch->Echo("You are full.\r\n");

            if(ch->PCData->Condition[COND_THIRST] > 40)
                ch->Echo("You feel bloated.\r\n");
            else if(ch->PCData->Condition[COND_THIRST] > 36)
                ch->Echo("Your stomach is sloshing around.\r\n");
            else if(ch->PCData->Condition[COND_THIRST] > 30)
                ch->Echo("You do not feel thirsty.\r\n");
        }

        if(obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] > 0)
        {
            /* The drink was poisoned! */
            std::shared_ptr<Affect> af = std::make_shared<Affect>();

            Act(AT_POISON, "$n sputters and gags.", ch, NULL, NULL, ActTarget::Room);
            Act(AT_POISON, "You sputter and gag.", ch, NULL, NULL, ActTarget::Char);
            ch->MentalState = urange(20, ch->MentalState + 5, 100);
            af->Type = gsn_poison;
            af->Duration = 3 * obj->Value[OVAL_DRINK_CON_POISON_STRENGTH];
            af->Location = APPLY_NONE;
            af->Modifier = 0;
            af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Poison });
            JoinAffect(ch, af);
        }

        obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] -= 1;
        break;
    }

    SetWaitState(ch, PULSE_PER_SECOND);
}

static std::shared_ptr<Object> FindFountain(std::shared_ptr<Room> location)
{
    return Find(location->Objects(),
                [](const auto fountain)
                {
                    return fountain->ItemType == ITEM_FOUNTAIN || fountain->ItemType == ITEM_BLOOD;
                });
}
