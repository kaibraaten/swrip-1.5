#include "character.h"
#include "mud.h"

void do_kick( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char logbuf[MAX_STRING_LENGTH];

  if ( is_npc(ch) && is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }


  WAIT_STATE( ch, skill_table[gsn_kick]->beats );

  if ( is_npc(ch) || number_percent( ) < ch->pcdata->learned[gsn_kick] )
    {
      learn_from_success( ch, gsn_kick );
      global_retcode = damage( ch, victim, number_range( 1, get_level(ch, COMBAT_ABILITY ) ), gsn_kick );
    }
  else
    {
      learn_from_failure( ch, gsn_kick );
      global_retcode = damage( ch, victim, 0, gsn_kick );
    }
}
