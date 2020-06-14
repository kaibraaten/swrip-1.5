#include <cstring>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"

static bool IsOwnerOf(const Character *owner, const Character *pet)
{
    return owner->PCData != nullptr
        && owner->PCData->Pet == pet;
}

static bool CanGiveOrderTo(const Character *leader, const Character *follower)
{
    return (IsAffectedBy(follower, Flag::Affect::Charm)
            && follower->Master == leader)
        || IsOwnerOf(leader, follower);
}

void do_order(Character *ch, std::string argument)
{
    std::string arg;
    Character *victim = NULL;
    bool fAll = false;
    std::string argbuf = argument;

    argument = OneArgument(argument, arg);

    if(arg.empty() || argument.empty())
    {
        ch->Echo("Order whom to do what?\r\n");
        return;
    }

    if(IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You feel like taking, not giving, orders.\r\n");
        return;
    }

    if(!StrCmp(arg, "all"))
    {
        fAll = true;
    }
    else
    {
        if((victim = GetCharacterInRoom(ch, arg)) == NULL)
        {
            ch->Echo("They aren't here.\r\n");
            return;
        }

        if(victim == ch)
        {
            ch->Echo("Aye aye, right away!\r\n");
            return;
        }

        if(!CanGiveOrderTo(ch, victim))
        {
            ch->Echo("Do it yourself!\r\n");
            return;
        }
    }

    if(!StringPrefix("mp", argument))
    {
        ch->Echo("But that's cheating!\r\n");
        return;
    }

    std::list<Character *> charactersToOrder = Filter(ch->InRoom->Characters(),
                                                      [ch, fAll, victim](auto och)
                                                      {
                                                          return CanGiveOrderTo(ch, och)
                                                              && (fAll || och == victim);
                                                      });

    if(!charactersToOrder.empty())
    {
        for(Character *och : charactersToOrder)
        {
            Act(AT_ACTION, "$n orders you to '$t'.",
                ch, argument.c_str(), och, ActTarget::Vict);
            Interpret(och, argument);
        }

        Log->Info("%s: order %s.", ch->Name.c_str(), argbuf.c_str());
        ch->Echo("Ok.\r\n");
        SetWaitState(ch, 12);
    }
    else
    {
        ch->Echo("You have no followers here.\r\n");
    }
}
