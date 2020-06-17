#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"
#include "act.hpp"

void do_light(Character *ch, std::string arg)
{
    std::shared_ptr<Object> pipe_obj;

    if(arg.empty())
    {
        ch->Echo("Light what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if((pipe_obj = GetCarriedObject(ch, arg)) == NULL)
    {
        ch->Echo("You aren't carrying that.\r\n");
        return;
    }

    if(pipe_obj->ItemType != ITEM_PIPE)
    {
        ch->Echo("You can't light that.\r\n");
        return;
    }

    if(!IsBitSet(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT))
    {
        if(pipe_obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] < 1)
        {
            Act(AT_ACTION, "You try to light $p, but it's empty.", ch, pipe_obj, NULL, ActTarget::Char);
            Act(AT_ACTION, "$n tries to light $p, but it's empty.", ch, pipe_obj, NULL, ActTarget::Room);
            return;
        }

        Act(AT_ACTION, "You carefully light $p.", ch, pipe_obj, NULL, ActTarget::Char);
        Act(AT_ACTION, "$n carefully lights $p.", ch, pipe_obj, NULL, ActTarget::Room);
        SetBit(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT);
        return;
    }

    ch->Echo("It's already lit.\r\n");
}
