#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_unlock(Character *ch, std::string arg)
{
    Object *obj = NULL;
    std::shared_ptr<Exit> pexit;

    if(arg.empty())
    {
        ch->Echo("Unlock what?\r\n");
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
            ch->Echo("It can't be unlocked.\r\n");
            return;
        }

        if(!HasKey(ch, pexit->Key))
        {
            ch->Echo("You lack the key.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Locked))
        {
            ch->Echo("It's already unlocked.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Secret)
           || NiftyIsName(arg, pexit->Keyword))
        {
            ch->Echo("*Click*\r\n");
            Act(AT_ACTION, "$n unlocks the $d.",
                ch, NULL, pexit->Keyword.c_str(), ActTarget::Room);
            RemoveBExitFlag(pexit, Flag::Exit::Locked);
            return;
        }
    }

    if((obj = GetObjectHere(ch, arg)) != NULL)
    {
        /* 'unlock object' */
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
            ch->Echo("It can't be unlocked.\r\n");
            return;
        }

        if(!HasKey(ch, obj->Value[OVAL_CONTAINER_KEY]))
        {
            ch->Echo("You lack the key.\r\n");
            return;
        }

        if(!IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED))
        {
            ch->Echo("It's already unlocked.\r\n");
            return;
        }

        RemoveBit(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED);
        ch->Echo("*Click*\r\n");
        Act(AT_ACTION, "$n unlocks $p.", ch, obj, NULL, ActTarget::Room);
        return;
    }

    ch->Echo("You see no %s here.\r\n", arg.c_str());
}
