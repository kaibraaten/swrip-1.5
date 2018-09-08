#include "character.hpp"
#include "mud.hpp"

void do_report( Character *ch, std::string argument )
{
  char buf[MAX_INPUT_LENGTH] = {'\0'};

  if ( IsAffectedBy(ch, AFF_POSSESS) )
    {
      ch->Echo("You can't do that in your current state of mind!\r\n");
      return;
    }

  ch->Echo("You report: %d/%d hp %d/%d mv.\r\n",
             ch->HitPoints.Current, ch->HitPoints.Max,
             ch->Fatigue.Current, ch->Fatigue.Max   );

  sprintf( buf, "$n reports: %d/%d hp %d/%d.",
           ch->HitPoints.Current, ch->HitPoints.Max,
           ch->Fatigue.Current, ch->Fatigue.Max   );

  Act( AT_REPORT, buf, ch, NULL, NULL, TO_ROOM );
}

