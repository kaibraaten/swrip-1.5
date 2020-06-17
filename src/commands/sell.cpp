#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

void do_sell(Character *ch, std::string arg)
{
    char buf[MAX_STRING_LENGTH];
    Character *keeper = nullptr;
    std::shared_ptr<Object> obj;
    int cost = 0;
    bool spice = false;

    if(arg.empty())
    {
        ch->Echo("Sell what?\r\n");
        return;
    }

    if((keeper = FindKeeper(ch)) == NULL)
        return;

    if((obj = GetCarriedObject(ch, arg)) == NULL)
    {
        Act(AT_TELL, "$n tells you 'You don't have that item.'",
            keeper, NULL, ch, ActTarget::Vict);
        ch->Reply = keeper;
        return;
    }

    if(!CanDropObject(ch, obj))
    {
        ch->Echo("You can't let go of it!\r\n");
        return;
    }

    if(obj->Timer > 0)
    {
        Act(AT_TELL, "$n tells you, '$p is depreciating in value too quickly...'",
            keeper, obj, ch, ActTarget::Vict);
        return;
    }

    if((cost = GetObjectCost(ch, keeper, obj, false)) <= 0)
    {
        Act(AT_ACTION, "$n looks uninterested in $p.",
            keeper, obj, ch, ActTarget::Vict);
        return;
    }

    if(obj->ItemType == ITEM_SPICE)
        spice = true;

    if(cost > keeper->Gold && (EconomyHas(ch->InRoom->Area, cost) || spice))
    {
        Act(AT_TELL, "$n makes a credit transaction.", keeper, obj, ch, ActTarget::Vict);
        LowerEconomy(ch->InRoom->Area, cost - keeper->Gold);
    }

    if(!EconomyHas(ch->InRoom->Area, cost) && !spice)
    {
        Act(AT_ACTION, "$n can not afford $p right now.", keeper, obj, ch, ActTarget::Vict);
        return;
    }

    SeparateOneObjectFromGroup(obj);
    Act(AT_ACTION, "$n sells $p.", ch, obj, NULL, ActTarget::Room);
    sprintf(buf, "You sell $p for %d credit%s.",
            cost, cost == 1 ? "" : "s");
    Act(AT_ACTION, buf, ch, obj, NULL, ActTarget::Char);
    ch->Gold += cost;
    keeper->Gold -= cost;

    if(spice)
        BoostEconomy(ch->InRoom->Area, cost * 1.5);

    if(keeper->Gold < 0)
        keeper->Gold = 0;

    if(obj->ItemType == ITEM_TRASH)
    {
        ExtractObject(obj);
    }
    else if(obj->Flags.test(Flag::Obj::Contraband))
    {
        long ch_exp = umin(obj->Cost * 10, (GetRequiredXpForLevel(GetAbilityLevel(ch, SMUGGLING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, SMUGGLING_ABILITY))) / 10);
        ch->Echo("You receive %ld smuggling experience for unloading your contraband.\r\n ", ch_exp);
        GainXP(ch, SMUGGLING_ABILITY, ch_exp);

        if(obj->ItemType == ITEM_SPICE || obj->ItemType == ITEM_RAWSPICE)
            ExtractObject(obj);
        else
        {
            obj->Flags.reset(Flag::Obj::Contraband);
            ObjectFromCharacter(obj);
            ObjectToCharacter(obj, keeper);
        }
    }
    else if(obj->ItemType == ITEM_SPICE || obj->ItemType == ITEM_RAWSPICE)
        ExtractObject(obj);
    else
    {
        ObjectFromCharacter(obj);
        ObjectToCharacter(obj, keeper);
    }
}
