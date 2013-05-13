#include "mud.h"

void do_mpapplyb( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;

  if ( !IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if (argument[0] == '\0')
    {
      progbug("Mpapplyb - bad syntax", ch );
      return;
    }

  if ( (victim = get_char_room_mp( ch, argument ) ) == NULL )
    {
      progbug("Mpapplyb - no such player in room.", ch );
      return;
    }

  if ( !victim->desc )
    {
      send_to_char( "Not on linkdeads.\r\n", ch );
      return;
    }

  if( !NOT_AUTHED(victim) )
    return;

  if ( get_timer(victim, TIMER_APPLIED) >= 1)
    return;

  switch( victim->pcdata->auth_state )
    {
    case 0:
    case 1:
    default:
      send_to_char( "You attempt to regain the gods' attention.\r\n", victim);
      sprintf( log_buf, "%s@%s new %s applying for authorization...",
               victim->name, victim->desc->host,
               race_table[victim->race].race_name);
      log_string( log_buf );
      to_channel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
      add_timer(victim, TIMER_APPLIED, 10, NULL, 0);
      victim->pcdata->auth_state = 1;
      break;

    case 2:
      send_to_char("Your name has been deemed unsuitable by the gods.  Please choose a more apropriate name with the 'name' command.\r\n", victim);
      add_timer(victim, TIMER_APPLIED, 10, NULL, 0);
      break;

    case 3:
      send_to_char( "The gods permit you to enter the Star Wars Reality.\r\n", victim);
      REMOVE_BIT(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->fighting )
        stop_fighting( victim, TRUE );
      char_from_room(victim);
      char_to_room(victim, get_room_index(ROOM_VNUM_SCHOOL));
      act( AT_WHITE, "$n enters this world from within a column of blinding light!",
           victim, NULL, NULL, TO_ROOM );
      do_look(victim, "auto");
      break;
    }
}
