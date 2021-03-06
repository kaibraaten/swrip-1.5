#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_report(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_INPUT_LENGTH] = { '\0' };

    if(IsAffectedBy(ch, Flag::Affect::Possess))
    {
        ch->Echo("You can't do that in your current state of mind!\r\n");
        return;
    }

    ch->Echo("You report: %d/%d hp %d/%d mv.\r\n",
             ch->HitPoints.Current, ch->HitPoints.Max,
             ch->Fatigue.Current, ch->Fatigue.Max);

    sprintf(buf, "$n reports: %d/%d hp %d/%d.",
            ch->HitPoints.Current, ch->HitPoints.Max,
            ch->Fatigue.Current, ch->Fatigue.Max);

    Act(AT_REPORT, buf, ch, NULL, NULL, ActTarget::Room);
}
