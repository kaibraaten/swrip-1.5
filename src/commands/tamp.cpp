#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"
#include "act.hpp"

void do_tamp(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> pipe_obj;

    if(arg.empty())
    {
        ch->Echo("Tamp what?\r\n");
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
        ch->Echo("You can't tamp that.\r\n");
        return;
    }

    if(!IsBitSet(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_TAMPED))
    {
        Act(AT_ACTION, "You gently tamp $p.", ch, pipe_obj, NULL, ActTarget::Char);
        Act(AT_ACTION, "$n gently tamps $p.", ch, pipe_obj, NULL, ActTarget::Room);
        SetBit(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_TAMPED);
        return;
    }

    ch->Echo("It doesn't need tamping.\r\n");
}
