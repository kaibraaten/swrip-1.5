#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_value(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    Character *keeper = nullptr;
    std::shared_ptr<Object> obj;
    int cost = 0;

    if(argument.empty())
    {
        ch->Echo("Value what?\r\n");
        return;
    }

    if((keeper = FindKeeper(ch)) == NULL)
        return;

    if((obj = GetCarriedObject(ch, argument)) == nullptr)
    {
        Act(AT_TELL, "$n tells you 'You don't have that item.'",
            keeper, nullptr, ch, ActTarget::Vict);
        ch->Reply = keeper;
        return;
    }

    if(!CanDropObject(ch, obj))
    {
        ch->Echo("You can't let go of it!\r\n");
        return;
    }

    if((cost = GetObjectCost(ch, keeper, obj, false)) <= 0)
    {
        Act(AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, ActTarget::Vict);
        return;
    }

    sprintf(buf, "$n tells you 'I'll give you %d credits for $p.'", cost);
    Act(AT_TELL, buf, keeper, obj, ch, ActTarget::Vict);
    ch->Reply = keeper;
}
