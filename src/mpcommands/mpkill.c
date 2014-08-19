#include "character.h"
#include "mud.h"

/* lets the mobile kill any player or mobile without murder*/

void do_mpkill( Character *ch, char *argument )
{
  char      arg[ MAX_INPUT_LENGTH ];
  Character *victim;

  if (!ch )
    {
      bug( "Nonexistent ch in do_mpkill!", 0 );
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

  if ( arg[0] == '\0' )
    {
      progbug( "MpKill - no argument", ch );
      return;
    }

  if ( ( victim = get_char_room_mp( ch, arg ) ) == NULL )
    {
      progbug( "MpKill - Victim not in room", ch );
      return;
    }

  if ( victim == ch )
    {
      progbug( "MpKill - Bad victim to attack", ch );
      return;
    }

  if ( IsAffectedBy( ch, AFF_CHARM ) && ch->master == victim )
    {
      progbug( "MpKill - Charmed mob attacking master", ch );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      progbug( "MpKill - Already fighting", ch );
      return;
    }

  multi_hit( ch, victim, TYPE_UNDEFINED );
}
