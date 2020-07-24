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
#include "timer.hpp"

void do_dig(std::shared_ptr<Character> ch, std::string arg)
{
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

        if(!arg.empty())
        {
            std::shared_ptr<Exit> pexit = FindDoor(ch, arg, true);

            if(pexit == nullptr
               && GetDirection(arg) == -1)
            {
                ch->Echo("What direction is that?\r\n");
                return;
            }

            if(pexit != nullptr)
            {
                if(!pexit->Flags.test(Flag::Exit::Dig)
                   && !pexit->Flags.test(Flag::Exit::Closed))
                {
                    ch->Echo("There is no need to dig out that exit.\r\n");
                    return;
                }
            }
        }
        else
        {
            switch(ch->InRoom->Sector)
            {
            case SECT_CITY:
            case SECT_INSIDE:
                ch->Echo("The floor is too hard to dig through.\r\n");
                return;

            case SECT_WATER_SWIM:
            case SECT_WATER_NOSWIM:
            case SECT_UNDERWATER:
                ch->Echo("You cannot dig here.\r\n");
                return;

            case SECT_AIR:
                ch->Echo("What? In the air?!\r\n");
                return;

            default:
                break;
            }
        }

        AddTimer(ch, TimerType::Command, umin(SkillTable[gsn_dig]->Beats / 10, 3), do_dig);
        ch->dest_buf = arg;
        ch->Echo("You begin digging...\r\n");
        Act(AT_PLAIN, "$n begins digging...", ch, NULL, NULL, ActTarget::Room);
        return;

    case CharacterSubState::Pause:
        if(ch->dest_buf.empty())
        {
            ch->Echo("Your digging was interrupted!\r\n");
            Act(AT_PLAIN, "$n's digging was interrupted!", ch, NULL, NULL, ActTarget::Room);
            Log->Bug("do_dig: dest_buf NULL");
            return;
        }

        arg = ch->dest_buf;
        ch->dest_buf.erase();
        break;

    case CharacterSubState::TimerDoAbort:
        ch->dest_buf.erase();
        ch->SubState = CharacterSubState::None;
        ch->Echo("You stop digging...\r\n");
        Act(AT_PLAIN, "$n stops digging...", ch, NULL, NULL, ActTarget::Room);
        return;
    }

    ch->SubState = CharacterSubState::None;

    /* not having a shovel makes it harder to succeed */
    bool shovel = GetFirstObjectOfType(ch, ITEM_SHOVEL) != nullptr;

    /* dig out an EX_DIG exit... */
    if(!arg.empty())
    {
        std::shared_ptr<Exit> pexit = FindDoor(ch, arg, true);

        if(pexit != nullptr
           && pexit->Flags.test(Flag::Exit::Dig)
           && pexit->Flags.test(Flag::Exit::Closed))
        {
            /* 4 times harder to dig open a passage without a shovel */
            if((GetRandomPercent() * (shovel ? 1 : 4)) <
               (IsNpc(ch) ? 80 : GetSkillLevel(ch, gsn_dig)))
            {
                pexit->Flags.reset(Flag::Exit::Closed);
                ch->Echo("You dig open a passageway!\r\n");
                Act(AT_PLAIN, "$n digs open a passageway!", ch, NULL, NULL, ActTarget::Room);
                LearnFromSuccess(ch, gsn_dig);
                return;
            }
        }

        LearnFromFailure(ch, gsn_dig);
        ch->Echo("Your dig did not discover any exit...\r\n");
        Act(AT_PLAIN, "$n's dig did not discover any exit...", ch, NULL, NULL, ActTarget::Room);
        return;
    }

    bool found = false;
    std::shared_ptr<Object> obj;

    for(auto i = std::begin(ch->InRoom->Objects()); i != std::end(ch->InRoom->Objects()); ++i)
    {
        obj = *i;

        /* twice as hard to find something without a shovel */
        if(obj->Flags.test(Flag::Obj::Burried)
           && (GetRandomPercent() * (shovel ? 1 : 2)) <
           (IsNpc(ch) ? 80 : GetSkillLevel(ch, gsn_dig)))
        {
            found = true;
            break;
        }
    }

    if(!found)
    {
        ch->Echo("Your dig uncovered nothing.\r\n");
        Act(AT_PLAIN, "$n's dig uncovered nothing.", ch, NULL, NULL, ActTarget::Room);
        LearnFromFailure(ch, gsn_dig);
        return;
    }

    SeparateOneObjectFromGroup(obj);
    obj->Flags.reset(Flag::Obj::Burried);
    Act(AT_SKILL, "Your dig uncovered $p!", ch, obj, NULL, ActTarget::Char);
    Act(AT_SKILL, "$n's dig uncovered $p!", ch, obj, NULL, ActTarget::Room);
    LearnFromSuccess(ch, gsn_dig);
}
