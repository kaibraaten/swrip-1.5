#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "systemdata.hpp"
#include "repos/playerrepository.hpp"
#include "act.hpp"

void do_empty(Character *ch, std::string argument)
{
    Object *obj = nullptr;
    std::string arg1;
    std::string arg2;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(!StrCmp(arg2, "into") && !argument.empty())
        argument = OneArgument(argument, arg2);

    if(arg1.empty())
    {
        ch->Echo("Empty what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if((obj = GetCarriedObject(ch, arg1)) == NULL)
    {
        ch->Echo("You aren't carrying that.\r\n");
        return;
    }

    if(obj->Count > 1)
        SeparateOneObjectFromGroup(obj);

    switch(obj->ItemType)
    {
    default:
        Act(AT_ACTION, "You shake $p in an attempt to empty it...", ch, obj, NULL, TO_CHAR);
        Act(AT_ACTION, "$n begins to shake $p in an attempt to empty it...", ch, obj, NULL, TO_ROOM);
        return;

    case ITEM_PIPE:
        Act(AT_ACTION, "You gently tap $p and empty it out.", ch, obj, NULL, TO_CHAR);
        Act(AT_ACTION, "$n gently taps $p and empties it out.", ch, obj, NULL, TO_ROOM);
        RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH);
        RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT);
        obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] = 0;
        return;

    case ITEM_DRINK_CON:
        if(obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 1)
        {
            ch->Echo("It's already empty.\r\n");
            return;
        }

        Act(AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR);
        Act(AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM);
        obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] = 0;
        return;

    case ITEM_CONTAINER:
        if(IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
        {
            Act(AT_PLAIN, "The $d is closed.", ch, NULL, obj->Name.c_str(), TO_CHAR);
            return;
        }

        if(obj->Objects().empty())
        {
            ch->Echo("It's already empty.\r\n");
            return;
        }

        if(arg2.empty())
        {
            if(ch->InRoom->Flags.test(Flag::Room::NoDrop)
               || (!IsNpc(ch) && ch->Flags.test(Flag::Plr::Litterbug)))
            {
                SetCharacterColor(AT_MAGIC, ch);
                ch->Echo("A magical force stops you!\r\n");
                SetCharacterColor(AT_TELL, ch);
                ch->Echo("Someone tells you, 'No littering here!'\r\n");
                return;
            }

            if(ch->InRoom->Flags.test(Flag::Room::NoDropAll))
            {
                ch->Echo("You can't seem to do that here...\r\n");
                return;
            }

            if(EmptyObjectContents(obj, NULL, ch->InRoom))
            {
                Act(AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR);
                Act(AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM);

                if(SysData.SaveFlags.test(Flag::AutoSave::Drop))
                {
                    PlayerCharacters->Save(ch);
                }
            }
            else
            {
                ch->Echo("Hmmm... didn't work.\r\n");
            }
        }
        else
        {
            Object *dest = GetObjectHere(ch, arg2);

            if(!dest)
            {
                ch->Echo("You can't find it.\r\n");
                return;
            }

            if(dest == obj)
            {
                ch->Echo("You can't empty something into itself!\r\n");
                return;
            }

            if(dest->ItemType != ITEM_CONTAINER)
            {
                ch->Echo("That's not a container!\r\n");
                return;
            }

            if(IsBitSet(dest->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
            {
                Act(AT_PLAIN, "The $d is closed.", ch, NULL, dest->Name.c_str(), TO_CHAR);
                return;
            }

            SeparateOneObjectFromGroup(dest);

            if(EmptyObjectContents(obj, dest, NULL))
            {
                Act(AT_ACTION, "You empty $p into $P.", ch, obj, dest, TO_CHAR);
                Act(AT_ACTION, "$n empties $p into $P.", ch, obj, dest, TO_ROOM);

                if(!dest->CarriedBy
                   && SysData.SaveFlags.test(Flag::AutoSave::Put))
                {
                    PlayerCharacters->Save(ch);
                }
            }
            else
            {
                Act(AT_ACTION, "$P is too full.", ch, obj, dest, TO_CHAR);
            }
        }

        return;
    }
}
