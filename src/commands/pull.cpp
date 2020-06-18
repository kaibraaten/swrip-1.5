#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_pull(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> obj;

    if(arg.empty())
    {
        ch->Echo("Pull what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if((obj = GetObjectHere(ch, arg)) == NULL)
    {
        Act(AT_PLAIN, "I see no $T here.", ch, nullptr, arg, ActTarget::Char);
        return;
    }

    PullOrPush(ch, obj, true);
}

