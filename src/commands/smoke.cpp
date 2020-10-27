#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "object.hpp"
#include "act.hpp"
#include "triggers.hpp"

void do_smoke(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> pipe_obj;

    if(arg.empty())
    {
        ch->Echo("Smoke what?\r\n");
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
        Act(AT_ACTION, "You try to smoke $p... but it doesn't seem to work.",
            ch, pipe_obj, NULL, ActTarget::Char);
        Act(AT_ACTION, "$n tries to smoke $p... (I wonder what $e's been putting his $s pipe?)",
            ch, pipe_obj, NULL, ActTarget::Room);
        return;
    }

    if(!IsBitSet(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT))
    {
        Act(AT_ACTION, "You try to smoke $p, but it's not lit.", ch, pipe_obj, NULL, ActTarget::Char);
        Act(AT_ACTION, "$n tries to smoke $p, but it's not lit.", ch, pipe_obj, NULL, ActTarget::Room);
        return;
    }

    if(pipe_obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] > 0)
    {
        if(!ObjProgUseTrigger(ch, pipe_obj, nullptr, nullptr, nullptr))
        {
            Act(AT_ACTION, "You draw thoughtfully from $p.",
                ch, pipe_obj, nullptr, ActTarget::Char);
            Act(AT_ACTION, "$n draws thoughtfully from $p.",
                ch, pipe_obj, nullptr, ActTarget::Room);
        }

        if(IS_VALID_HERB(pipe_obj->Value[OVAL_PIPE_TOBACCO_HERB])
           && pipe_obj->Value[OVAL_PIPE_TOBACCO_HERB] < TopHerb)
        {
            int sn = pipe_obj->Value[OVAL_PIPE_TOBACCO_HERB] + TYPE_HERB;
            std::shared_ptr<Skill> skill = GetSkill(sn);

            SetWaitState(ch, skill->Beats);

            if(skill->SpellFunction)
                CastSpellWithObject(sn, umin(skill->Level, ch->TopLevel()),
                                    ch, ch, NULL);

            if(IsObjectExtracted(pipe_obj))
                return;
        }
        else
        {
            Log->Bug("do_smoke: bad herb type %d", pipe_obj->Value[OVAL_PIPE_TOBACCO_HERB]);
        }

        SetBit(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT);

        if(--pipe_obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] < 1)
        {
            RemoveBit(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT);
            SetBit(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_DIRTY);
            SetBit(pipe_obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH);
        }
    }
}
