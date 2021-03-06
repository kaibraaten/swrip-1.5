#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_open(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Object> obj;
    std::shared_ptr<Exit> pexit;
    int door = 0;

    OneArgument(argument, arg);

    if(arg.empty())
    {
        do_openhatch(ch, "");
        return;
    }

    if((pexit = FindDoor(ch, arg, true)) != NULL)
    {
        std::shared_ptr<Exit> pexit_rev;

        if(!pexit->Flags.test(Flag::Exit::IsDoor))
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Closed))
        {
            ch->Echo("It's already open.\r\n");
            return;
        }

        if(pexit->Flags.test(Flag::Exit::Locked))
        {
            ch->Echo("It's locked.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Secret)
           || NiftyIsName(arg, pexit->Keyword))
        {
            Act(AT_ACTION, "$n opens the $d.",
                ch, nullptr, pexit->Keyword, ActTarget::Room);
            Act(AT_ACTION, "You open the $d.",
                ch, nullptr, pexit->Keyword, ActTarget::Char);

            if((pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom)
            {
                for(auto rch : pexit->ToRoom->Characters())
                {
                    Act(AT_ACTION, "The $d opens.",
                        rch, nullptr, pexit_rev->Keyword, ActTarget::Char);
                }
            }

            RemoveBExitFlag(pexit, Flag::Exit::Closed);
            door = pexit->Direction;

            if(door >= TRAP_N && door <= TRAP_SW)
            {
                CheckRoomForTraps(ch, TrapDoor[door]);
            }

            return;
        }
    }

    if((obj = GetObjectHere(ch, arg)) != NULL)
    {
        if(obj->ItemType != ITEM_CONTAINER)
        {
            if(obj->WearFlags.test(Flag::Wear::Over))
            {
                obj->Value[2] = 0;
                Act(AT_ACTION, "You open $p.", ch, obj, NULL, ActTarget::Char);
                Act(AT_ACTION, "$n opens $p.", ch, obj, NULL, ActTarget::Room);
                CheckObjectForTrap(ch, obj, TRAP_OPEN);
                return;

            }

            ch->Echo("%s isn't a container.\r\n",
                     Capitalize(obj->ShortDescr).c_str());
            return;
        }

        if(!IsBitSet(obj->Value[1], CONT_CLOSED))
        {
            ch->Echo("%s is already open.\r\n",
                     Capitalize(obj->ShortDescr).c_str());
            return;
        }

        if(!IsBitSet(obj->Value[1], CONT_CLOSEABLE))
        {
            ch->Echo("%s cannot be opened or closed.\r\n",
                     Capitalize(obj->ShortDescr).c_str());
            return;
        }

        if(IsBitSet(obj->Value[1], CONT_LOCKED))
        {
            ch->Echo("%s is locked.\r\n", Capitalize(obj->ShortDescr).c_str());
            return;
        }

        RemoveBit(obj->Value[1], CONT_CLOSED);
        Act(AT_ACTION, "You open $p.", ch, obj, NULL, ActTarget::Char);
        Act(AT_ACTION, "$n opens $p.", ch, obj, NULL, ActTarget::Room);
        CheckObjectForTrap(ch, obj, TRAP_OPEN);
        return;
    }

    if(!StrCmp(arg, "hatch"))
    {
        do_openhatch(ch, argument);
        return;
    }

    do_openhatch(ch, argument);
}

