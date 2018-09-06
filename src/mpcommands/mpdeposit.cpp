#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

/*
 * Deposit some gold into the current area's economy            -Thoric
 */
void do_mp_deposit( Character *ch, std::string arg )
{
  long gold = 0;

  if ( !IsNpc(ch) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( arg.empty() )
    {
      ProgBug("Mpdeposit - bad syntax", ch );
      return;
    }

  gold = std::stoi( arg );

  if ( gold <= ch->Gold && ch->InRoom )
    {
      ch->Gold -= gold;
      BoostEconomy( ch->InRoom->Area, gold );
    }
}
