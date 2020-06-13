#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

void do_poison_weapon(Character *ch, std::string arg)
{
    if(!IsNpc(ch)
       && ch->PCData->Learned[gsn_poison_weapon] <= 0)
    {
        ch->Echo("What do you think you are, a bounty hunter?\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("What are you trying to poison?\r\n");
        return;
    }

    if(ch->Fighting)
    {
        ch->Echo("While you're fighting? Nice try.\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    Object *obj = GetCarriedObject(ch, arg);

    if(obj == nullptr)
    {
        ch->Echo("You do not have that weapon.\r\n");
        return;
    }

    if(obj->ItemType != ITEM_WEAPON)
    {
        ch->Echo("That item is not a weapon.\r\n");
        return;
    }

    if(obj->Value[OVAL_WEAPON_TYPE] != WEAPON_VIBRO_BLADE
       && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE)
    {
        ch->Echo("You can not apply poison to that.\r\n");
        return;
    }

    if(obj->Flags.test(Flag::Obj::Poisoned))
    {
        ch->Echo("That weapon is already poisoned.\r\n");
        return;
    }

    auto pobj = Find(ch->Objects(),
                     [](auto o)
                     {
                         return o->Prototype->Vnum == OBJ_VNUM_BLACK_POWDER;
                     });

    if(!pobj)
    {
        ch->Echo("You do not have the black poison powder.\r\n");
        return;
    }

    /* Okay, we have the powder...do we have water? */
    auto wobj = Find(ch->Objects(),
                     [](auto o)
                     {
                         return o->ItemType == ITEM_DRINK_CON
                             && o->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] > 0
                             && o->Value[OVAL_DRINK_CON_LIQUID_TYPE] == 0;
                     });

    if(!wobj)
    {
        ch->Echo("You have no water to mix with the powder.\r\n");
        return;
    }

    /* And does the thief have steady enough hands? */
    if(!IsNpc(ch)
       && (ch->PCData->Condition[COND_DRUNK] > 0))
    {
        ch->Echo("Your hands aren't steady enough to properly mix the poison.\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_poison_weapon]->Beats);

    int percent = (GetRandomPercent() - GetCurrentLuck(ch) - 14);

    /* Check the skill percentage */
    SeparateOneObjectFromGroup(pobj);
    SeparateOneObjectFromGroup(wobj);

    if(!IsNpc(ch)
       && percent > ch->PCData->Learned[gsn_poison_weapon])
    {
        SetCharacterColor(AT_RED, ch);
        ch->Echo("You failed and spill some on yourself. Ouch!\r\n");
        SetCharacterColor(AT_GREY, ch);
        InflictDamage(ch, ch, GetAbilityLevel(ch, HUNTING_ABILITY), gsn_poison_weapon);
        Act(AT_RED, "$n spills the poison all over!", ch, NULL, NULL, TO_ROOM);
        ExtractObject(pobj);
        ExtractObject(wobj);
        LearnFromFailure(ch, gsn_poison_weapon);
        return;
    }

    SeparateOneObjectFromGroup(obj);
    /* Well, I'm tired of waiting.  Are you? */
    Act(AT_RED, "You mix $p in $P, creating a deadly poison!", ch, pobj, wobj, TO_CHAR);
    Act(AT_RED, "$n mixes $p in $P, creating a deadly poison!", ch, pobj, wobj, TO_ROOM);
    Act(AT_GREEN, "You pour the poison over $p, which glistens wickedly!", ch, obj, NULL, TO_CHAR);
    Act(AT_GREEN, "$n pours the poison over $p, which glistens wickedly!", ch, obj, NULL, TO_ROOM);
    obj->Flags.set(Flag::Obj::Poisoned);
    obj->Cost *= GetAbilityLevel(ch, HUNTING_ABILITY) / 2;
    /* Set an object timer.  Don't want proliferation of poisoned weapons */
    obj->Timer = 10 + GetAbilityLevel(ch, HUNTING_ABILITY);

    if(obj->Flags.test(Flag::Obj::Bless))
        obj->Timer *= 2;

    if(obj->Flags.test(Flag::Obj::Magic))
        obj->Timer *= 2;

    /* WHAT?  All of that, just for that one bit?  How lame. ;) */
    Act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_CHAR);
    Act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_ROOM);
    ExtractObject(pobj);
    ExtractObject(wobj);
    LearnFromSuccess(ch, gsn_poison_weapon);
}
