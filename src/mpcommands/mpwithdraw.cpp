#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

/*
 * Withdraw some gold from the current area's economy           -Thoric
 */
void do_mp_withdraw( std::shared_ptr<Character> ch, std::string arg )
{
  long gold = 0;

  if ( !IsNpc(ch) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( arg.empty() )
    {
      ProgBug("Mpwithdraw - bad syntax", ch );
      return;
    }

  gold = ToLong( arg );

  if ( ch->Gold < 1000000000 && gold < 1000000000 && ch->InRoom
       &&   EconomyHas( ch->InRoom->Area, gold ) )
    {
      ch->Gold += gold;
      LowerEconomy( ch->InRoom->Area, gold );
    }
}
