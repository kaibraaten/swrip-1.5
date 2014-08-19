#include "character.h"
#include "mud.h"

void do_report( Character *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];

  if ( IsAffectedBy(ch, AFF_POSSESS) )
    {
      SendToCharacter("You can't do that in your current state of mind!\r\n", ch);
      return;
    }

  ChPrintf( ch, "You report: %d/%d hp %d/%d mv.\r\n",
             ch->hit,  ch->max_hit,
             ch->move, ch->max_move   );

  sprintf( buf, "$n reports: %d/%d hp %d/%d.",
           ch->hit,  ch->max_hit,
           ch->move, ch->max_move   );

  act( AT_REPORT, buf, ch, NULL, NULL, TO_ROOM );
}
