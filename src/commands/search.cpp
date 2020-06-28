#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_search(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> obj;
    std::shared_ptr<Object> container;
    std::list<std::shared_ptr<Object>> searchList;
    int percent = 0;
    DirectionType door = DIR_INVALID;
    bool found = false;

    switch(ch->SubState)
    {
    default:
        if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
        {
            ch->Echo("You can't concentrate enough for that.\r\n");
            return;
        }

        if(ch->Mount)
        {
            ch->Echo("You can't do that while mounted.\r\n");
            return;
        }

        if(!arg.empty() && (door = GetDirection(arg)) == -1)
        {
            container = GetObjectHere(ch, arg);

            if(!container)
            {
                ch->Echo("You can't find that here.\r\n");
                return;
            }

            if(container->ItemType != ITEM_CONTAINER)
            {
                ch->Echo("You can't search in that!\r\n");
                return;
            }

            if(IsBitSet(container->Value[1], CONT_CLOSED))
            {
                ch->Echo("It is closed.\r\n");
                return;
            }
        }

        AddTimerToCharacter(ch, TIMER_CMD_FUN, umin(SkillTable[gsn_search]->Beats / 10, 3), do_search, SUB_PAUSE);
        ch->Echo("You begin your search...\r\n");
        ch->dest_buf = arg;
        return;

    case SUB_PAUSE:
        if(ch->dest_buf.empty())
        {
            ch->Echo("Your search was interrupted!\r\n");
            Log->Bug("do_search: dest_buf NULL");
            return;
        }

        arg = ch->dest_buf;
        ch->dest_buf.erase();
        break;

    case SUB_TIMER_DO_ABORT:
        ch->dest_buf.erase();
        ch->SubState = SUB_NONE;
        ch->Echo("You stop your search...\r\n");
        return;
    }

    ch->SubState = SUB_NONE;

    if(arg.empty())
    {
        searchList = ch->InRoom->Objects();
    }
    else
    {
        door = GetDirection(arg);

        if(door == DIR_INVALID)
        {
            container = GetObjectHere(ch, arg);

            if(container == nullptr)
            {
                ch->Echo("You can't find that here.\r\n");
                return;
            }

            searchList = container->Objects();
        }
    }

    found = false;

    if((searchList.empty() && door == DIR_INVALID) || IsNpc(ch))
    {
        ch->Echo("You find nothing.\r\n");
        LearnFromFailure(ch, gsn_search);
        return;
    }

    percent = GetRandomPercent();

    if(door != -1)
    {
        std::shared_ptr<Exit> pexit;

        if((pexit = GetExit(ch->InRoom, door)) != NULL
           && pexit->Flags.test(Flag::Exit::Secret)
           && pexit->Flags.test(Flag::Exit::Searchable)
           && percent < (IsNpc(ch) ? 80 : GetSkillLevel(ch, gsn_search)))
        {
            Act(AT_SKILL, "Your search reveals the $d!",
                ch, nullptr, pexit->Keyword, ActTarget::Char);
            Act(AT_SKILL, "$n finds the $d!", ch, nullptr, pexit->Keyword, ActTarget::Room);
            pexit->Flags.reset(Flag::Exit::Secret);
            LearnFromSuccess(ch, gsn_search);
            return;
        }
    }
    else
    {
        for(auto hiddenObject : searchList)
        {
            if(obj->Flags.test(Flag::Obj::Hidden)
               && percent < GetSkillLevel(ch, gsn_search))
            {
                obj = hiddenObject;
                found = true;
                break;
            }
        }
    }

    if(!found)
    {
        ch->Echo("You find nothing.\r\n");
        LearnFromFailure(ch, gsn_search);
        return;
    }

    SeparateOneObjectFromGroup(obj);
    obj->Flags.reset(Flag::Obj::Hidden);
    Act(AT_SKILL, "Your search reveals $p!", ch, obj, NULL, ActTarget::Char);
    Act(AT_SKILL, "$n finds $p!", ch, obj, NULL, ActTarget::Room);
    LearnFromSuccess(ch, gsn_search);
}
