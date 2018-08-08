#include "character.hpp"
#include "mud.hpp"

/*
 * Deposit some gold into the current area's economy            -Thoric
 */
void do_mp_deposit( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  int gold;

  if ( !IsNpc(ch) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  OneArgument(argument, arg);

  if ( IsNullOrEmpty( arg ) )
    {
      ProgBug("Mpdeposit - bad syntax", ch );
      return;
    }

  gold = atoi( arg );

  if ( gold <= ch->Gold && ch->InRoom )
    {
      ch->Gold -= gold;
      BoostEconomy( ch->InRoom->Area, gold );
    }
}

