#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "act.hpp"

void do_remove(Character *ch, std::string arg)
{
    if(arg.empty())
    {
        ch->Echo("Remove what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if(!StrCmp(arg, "all"))  /* SB Remove all */
    {
        auto carriedObjects = ch->Objects();

        for(auto obj : carriedObjects)
        {
            if(obj->WearLoc != WEAR_NONE && CanSeeObject(ch, obj))
            {
                RemoveObject(ch, obj->WearLoc, true);
            }
        }

        return;
    }

    auto obj = GetWornObject(ch, arg);

    if(obj == nullptr)
    {
        ch->Echo("You are not using that item.\r\n");
        return;
    }

    auto alreadyWorn = GetEquipmentOnCharacter(ch, obj->WearLoc);

    if(alreadyWorn != obj)
    {
        Act(AT_PLAIN, "You must remove $p first.",
            ch, alreadyWorn, nullptr, ActTarget::Char);
        return;
    }

    RemoveObject(ch, obj->WearLoc, true);
}
