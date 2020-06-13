#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_push(Character *ch, std::string arg)
{
    Object *obj = nullptr;

    if(arg.empty())
    {
        ch->Echo("Push what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if((obj = GetObjectHere(ch, arg)) == NULL)
    {
        Act(AT_PLAIN, "I see no $T here.", ch, NULL, arg.c_str(), TO_CHAR);
        return;
    }

    PullOrPush(ch, obj, false);
}
