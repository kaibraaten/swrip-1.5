#include "character.h"
#include "mud.h"

/*
 * Deposit some gold into the current area's economy            -Thoric
 */
void do_mp_deposit( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  int gold;

  if ( !IsNpc(ch) )
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  OneArgument(argument, arg);

  if ( IsNullOrEmpty( arg ) )
    {
      ProgBug("Mpdeposit - bad syntax", ch );
      return;
    }

  gold = atoi( arg );

  if ( gold <= ch->gold && ch->in_room )
    {
      ch->gold -= gold;
      BoostEconomy( ch->in_room->Area, gold );
    }
}
