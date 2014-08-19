#include "character.h"
#include "mud.h"

/*
 * Withdraw some gold from the current area's economy           -Thoric
 */
void do_mp_withdraw( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  int gold;

  if ( !IsNpc(ch) )
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  OneArgument(argument, arg);

  if ( arg[0] == '\0' )
    {
      ProgBug("Mpwithdraw - bad syntax", ch );
      return;
    }

  gold = atoi( arg );

  if ( ch->gold < 1000000000 && gold < 1000000000 && ch->in_room
       &&   economy_has( ch->in_room->area, gold ) )
    {
      ch->gold += gold;
      lower_economy( ch->in_room->area, gold );
    }
}
