#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_lock(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> obj;
    std::shared_ptr<Exit> pexit;

    if(arg.empty())
    {
        ch->Echo("Lock what?\r\n");
        return;
    }

    if((pexit = FindDoor(ch, arg, true)) != NULL)
    {
        if(!pexit->Flags.test(Flag::Exit::IsDoor))
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Closed))
        {
            ch->Echo("It's not closed.\r\n");
            return;
        }

        if(pexit->Key < 0)
        {
            ch->Echo("It can't be locked.\r\n");
            return;
        }

        if(!HasKey(ch, pexit->Key))
        {
            ch->Echo("You lack the key.\r\n");
            return;
        }

        if(pexit->Flags.test(Flag::Exit::Locked))
        {
            ch->Echo("It's already locked.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Secret)
           || (!pexit->Keyword.empty()
               && NiftyIsName(arg, pexit->Keyword)))
        {
            ch->Echo("*Click*\r\n");
            Act(AT_ACTION, "$n locks the $d.",
                ch, nullptr, pexit->Keyword, ActTarget::Room);
            SetBExitFlag(pexit, Flag::Exit::Locked);
            return;
        }
    }

    if((obj = GetObjectHere(ch, arg)) != NULL)
    {
        /* 'lock object' */
        if(obj->ItemType != ITEM_CONTAINER)
        {
            ch->Echo("That's not a container.\r\n");
            return;
        }

        if(!IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
        {
            ch->Echo("It's not closed.\r\n");
            return;
        }

        if(obj->Value[OVAL_CONTAINER_KEY] < 0)
        {
            ch->Echo("It can't be locked.\r\n");
            return;
        }

        if(!HasKey(ch, obj->Value[OVAL_CONTAINER_KEY]))
        {
            ch->Echo("You lack the key.\r\n");
            return;
        }

        if(IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED))
        {
            ch->Echo("It's already locked.\r\n");
            return;
        }

        SetBit(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED);
        ch->Echo("*Click*\r\n");
        Act(AT_ACTION, "$n locks $p.", ch, obj, NULL, ActTarget::Room);
        return;
    }

    ch->Echo("You see no %s here.\r\n", arg.c_str());
}
