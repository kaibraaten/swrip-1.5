#include <cassert>
#include "character.hpp"
#include "mud.hpp"

/* lets the mobile kill any player or mobile without murder*/

void do_mpkill( Character *ch, std::string arg )
{
  Character *victim = nullptr;

  assert(ch != nullptr);

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( arg.empty() )
    {
      ProgBug( "MpKill - no argument", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoomMudProg( ch, arg ) ) == NULL )
    {
      ProgBug( "MpKill - Victim not in room", ch );
      return;
    }

  if ( victim == ch )
    {
      ProgBug( "MpKill - Bad victim to attack", ch );
      return;
    }

  if ( IsAffectedBy( ch, AFF_CHARM ) && ch->Master == victim )
    {
      ProgBug( "MpKill - Charmed mob attacking master", ch );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      ProgBug( "MpKill - Already fighting", ch );
      return;
    }

  HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
}
