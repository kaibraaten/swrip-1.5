#include "mud.hpp"
#include "character.hpp"
#include "act.hpp"

void do_stand(std::shared_ptr<Character> ch, std::string argument)
{
    switch(ch->Position)
    {
    case POS_SLEEPING:
        if(IsAffectedBy(ch, Flag::Affect::Sleep))
        {
            ch->Echo("You can't seem to wake up!\r\n");
            return;
        }

        ch->Echo("You wake and climb quickly to your feet.\r\n");
        Act(AT_ACTION, "$n arises from $s slumber.", ch, NULL, NULL, ActTarget::Room);
        ch->Position = POS_STANDING;
        break;

    case POS_RESTING:
        ch->Echo("You gather yourself and stand up.\r\n");
        Act(AT_ACTION, "$n rises from $s rest.", ch, NULL, NULL, ActTarget::Room);
        ch->Position = POS_STANDING;
        break;

    case POS_SITTING:
        ch->Echo("You move quickly to your feet.\r\n");
        Act(AT_ACTION, "$n rises up.", ch, NULL, NULL, ActTarget::Room);
        ch->Position = POS_STANDING;
        break;

    case POS_STANDING:
        ch->Echo("You are already standing.\r\n");
        break;

    case POS_FIGHTING:
        ch->Echo("You are already fighting!\r\n");
        break;

    default:
        break;
    }

    ch->On = NULL;
}
