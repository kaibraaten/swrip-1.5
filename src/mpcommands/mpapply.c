#include "character.h"
#include "mud.h"

void do_mpapply( Character *ch, char *argument )
{
  Character *victim;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if (argument[0] == '\0')
    {
      progbug("Mpapply - bad syntax", ch );
      return;
    }

  if ( (victim = get_char_room_mp( ch, argument ) ) == NULL )
    {
      progbug("Mpapply - no such player in room.", ch );
      return;
    }

  if ( !victim->desc )
    {
      SendToCharacter( "Not on linkdeads.\r\n", ch );
      return;
    }

  if( IsAuthed(victim) )
    return;

  if( victim->pcdata->auth_state >= 1 )
    return;

  sprintf( log_buf, "%s@%s new %s applying for authorization...",
           victim->name, victim->desc->remote.hostname,
           RaceTable[victim->race].race_name);
  log_string( log_buf );
  ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  victim->pcdata->auth_state = 1;
}
