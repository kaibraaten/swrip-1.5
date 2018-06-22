#include "character.h"
#include "mud.h"

/* lets the mobile kill any player or mobile without murder*/

void do_mpkill( Character *ch, char *argument )
{
  char      arg[ MAX_INPUT_LENGTH ];
  Character *victim;

  if (!ch )
    {
      Bug( "Nonexistent ch in do_mpkill!", 0 );
      return;
    }

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
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
