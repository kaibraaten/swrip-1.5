#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_close(Character *ch, std::string argument)
{
    std::string arg;
    Object *obj = NULL;
    std::shared_ptr<Exit> pexit;
    int door = 0;

    OneArgument(argument, arg);

    if(arg.empty())
    {
        do_closehatch(ch, "");
        return;
    }

    if((pexit = FindDoor(ch, arg, true)) != NULL)
    {
        /* 'close door' */
        std::shared_ptr<Exit> pexit_rev;

        if(!pexit->Flags.test(Flag::Exit::IsDoor))
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }

        if(pexit->Flags.test(Flag::Exit::Closed))
        {
            ch->Echo("It's already closed.\r\n");
            return;
        }

        Act(AT_ACTION, "$n closes the $d.", ch, NULL, pexit->Keyword.c_str(), ActTarget::Room);
        Act(AT_ACTION, "You close the $d.", ch, NULL, pexit->Keyword.c_str(), ActTarget::Char);

        /* close the other side */
        if((pexit_rev = pexit->ReverseExit) != NULL
           && pexit_rev->ToRoom == ch->InRoom)
        {
            pexit_rev->Flags.set(Flag::Exit::Closed);

            for(Character *rch : pexit->ToRoom->Characters())
            {
                Act(AT_ACTION, "The $d closes.",
                    rch, NULL, pexit_rev->Keyword.c_str(), ActTarget::Char);
            }
        }

        SetBExitFlag(pexit, Flag::Exit::Closed);

        door = pexit->Direction;

        if(door > DIR_INVALID && door < DIR_SOMEWHERE)
        {
            CheckRoomForTraps(ch, TrapDoor[door]);
        }

        return;
    }

    if((obj = GetObjectHere(ch, arg)) != NULL)
    {
        if(obj->ItemType != ITEM_CONTAINER)
        {
            if(obj->WearFlags.test(Flag::Wear::Over))
            {
                obj->Value[2] = 1;
                Act(AT_ACTION, "You closes $p.", ch, obj, NULL, ActTarget::Char);
                Act(AT_ACTION, "$n closes $p.", ch, obj, NULL, ActTarget::Room);
                CheckObjectForTrap(ch, obj, TRAP_OPEN);
                return;

            }

            ch->Echo("%s isn't a container.\r\n",
                     Capitalize(obj->ShortDescr).c_str());
            return;
        }

        if(IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
        {
            ch->Echo("%s is already closed.\r\n",
                     Capitalize(obj->ShortDescr).c_str());
            return;
        }

        if(!IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSEABLE))
        {
            ch->Echo("%s cannot be opened or closed.\r\n",
                     Capitalize(obj->ShortDescr).c_str());
            return;
        }

        SetBit(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED);
        Act(AT_ACTION, "You close $p.", ch, obj, NULL, ActTarget::Char);
        Act(AT_ACTION, "$n closes $p.", ch, obj, NULL, ActTarget::Room);
        CheckObjectForTrap(ch, obj, TRAP_CLOSE);
        return;
    }

    if(!StrCmp(arg, "hatch"))
    {
        do_closehatch(ch, argument);
        return;
    }

    do_closehatch(ch, arg);
}

