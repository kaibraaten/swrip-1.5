#include "character.h"
#include "mud.h"

void do_mpapply( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;

  if ( !is_npc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
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
      send_to_char( "Not on linkdeads.\r\n", ch );
      return;
    }

  if( !is_not_authed(victim) )
    return;

  if( victim->pcdata->auth_state >= 1 )
    return;

  sprintf( log_buf, "%s@%s new %s applying for authorization...",
           victim->name, victim->desc->remote.host,
           race_table[victim->race].race_name);
  log_string( log_buf );
  to_channel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  victim->pcdata->auth_state = 1;
}
