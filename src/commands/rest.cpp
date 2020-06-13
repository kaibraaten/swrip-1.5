#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

void do_rest(Character *ch, std::string argument)
{
    Object *obj = NULL;

    if(ch->Position == POS_FIGHTING)
    {
        ch->Echo("You are already fighting!\r\n");
        return;
    }

    /* okay, now that we know we can rest, find an object to rest on */
    if(!argument.empty())
    {
        obj = GetObjectInList(ch, argument, ch->InRoom->Objects());

        if(obj == NULL)
        {
            ch->Echo("You don't see that here.\r\n");
            return;
        }
    }
    else
    {
        obj = ch->On;
    }

    if(obj != NULL)
    {
        if(obj->ItemType != ITEM_FURNITURE
           || (!obj->Value[OVAL_FURNITURE_PREPOSITION]))
        {
            ch->Echo("You can't rest on that.\r\n");
            return;
        }

        if(obj != NULL && ch->On != obj
           && CountCharactersOnObject(obj) >= obj->Value[OVAL_FURNITURE_CAPACITY])
        {
            Act(AT_ACTION, "There's no more room on $p.", ch, obj, NULL, TO_CHAR);
            return;
        }

        ch->On = obj;
    }

    switch(ch->Position)
    {
    case POS_SLEEPING:
        if(IsAffectedBy(ch, Flag::Affect::Sleep))
        {
            ch->Echo("You can't wake up!\r\n");
            return;
        }

        if(obj == NULL)
        {
            ch->Echo("You wake up and start resting.\r\n");
            Act(AT_ACTION, "$n wakes up and starts resting.",
                ch, NULL, NULL, TO_ROOM);
        }
        else if(obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
        {
            Act(AT_ACTION, "You wake up and rest at $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n wakes up and rests at $p.", ch, obj, NULL, TO_ROOM);
        }
        else if(obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
        {
            Act(AT_ACTION, "You wake up and rest on $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n wakes up and rests on $p.", ch, obj, NULL, TO_ROOM);
        }
        else
        {
            Act(AT_ACTION, "You wake up and rest in $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n wakes up and rests in $p.", ch, obj, NULL, TO_ROOM);
        }
        ch->Position = POS_RESTING;
        break;

    case POS_RESTING:
        ch->Echo("You are already resting.\r\n");
        break;

    case POS_STANDING:
        if(obj == NULL)
        {
            ch->Echo("You rest.\r\n");
            Act(AT_ACTION, "$n sits down and rests.", ch, NULL, NULL, TO_ROOM);
        }
        else if(obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
        {
            Act(AT_ACTION, "You sit down at $p and rest.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n sits down at $p and rests.", ch, obj, NULL, TO_ROOM);
        }
        else if(obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
        {
            Act(AT_ACTION, "You sit on $p and rest.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n sits on $p and rests.", ch, obj, NULL, TO_ROOM);
        }
        else
        {
            Act(AT_ACTION, "You rest in $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n rests in $p.", ch, obj, NULL, TO_ROOM);
        }
        ch->Position = POS_RESTING;
        break;

    case POS_SITTING:
        if(obj == NULL)
        {
            ch->Echo("You rest.\r\n");
            Act(AT_ACTION, "$n rests.", ch, NULL, NULL, TO_ROOM);
        }
        else if(obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
        {
            Act(AT_ACTION, "You rest at $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n rests at $p.", ch, obj, NULL, TO_ROOM);
        }
        else if(obj->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
        {
            Act(AT_ACTION, "You rest on $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n rests on $p.", ch, obj, NULL, TO_ROOM);
        }
        else
        {
            Act(AT_ACTION, "You rest in $p.", ch, obj, NULL, TO_CHAR);
            Act(AT_ACTION, "$n rests in $p.", ch, obj, NULL, TO_ROOM);
        }
        ch->Position = POS_RESTING;
        break;

    case POS_MOUNTED:
        ch->Echo("You'd better dismount first.\r\n");
        return;

    default:
        break;
    }

    RoomProgRestTrigger(ch);
}

