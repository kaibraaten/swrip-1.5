#include "character.hpp"
#include "mud.hpp"

/*
 * Withdraw some gold from the current area's economy           -Thoric
 */
void do_mp_withdraw( Character *ch, char *argument )
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
      ProgBug("Mpwithdraw - bad syntax", ch );
      return;
    }

  gold = atoi( arg );

  if ( ch->Gold < 1000000000 && gold < 1000000000 && ch->InRoom
       &&   EconomyHas( ch->InRoom->Area, gold ) )
    {
      ch->Gold += gold;
      LowerEconomy( ch->InRoom->Area, gold );
    }
}

