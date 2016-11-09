#include "character.hpp"
#include "mud.hpp"

void do_report( Character *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];

  if ( IsAffectedBy(ch, AFF_POSSESS) )
    {
      SendToCharacter("You can't do that in your current state of mind!\r\n", ch);
      return;
    }

  Echo( ch, "You report: %d/%d hp %d/%d mv.\r\n",
             ch->Hit,  ch->MaxHit,
             ch->Move, ch->MaxMove   );

  sprintf( buf, "$n reports: %d/%d hp %d/%d.",
           ch->Hit,  ch->MaxHit,
           ch->Move, ch->MaxMove   );

  Act( AT_REPORT, buf, ch, NULL, NULL, TO_ROOM );
}
