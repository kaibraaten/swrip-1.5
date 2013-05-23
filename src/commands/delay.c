#include "character.h"
#include "mud.h"

void do_delay( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim = NULL;
  char arg[MAX_INPUT_LENGTH];
  int delay = 0;

  set_char_color( AT_IMMORT, ch );

  argument = one_argument( argument, arg );

  if ( !*arg )
    {
      send_to_char( "Syntax:  delay <victim> <# of rounds>\r\n", ch );
      return;
    }

  if ( !( victim = get_char_world( ch, arg ) ) )
    {
      send_to_char( "No such character online.\r\n", ch );
      return;
    }

  if ( is_npc( victim ) )
    {
      send_to_char( "Mobiles are unaffected by lag.\r\n", ch );
      return;
    }

  if ( !is_npc(victim) && get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You haven't the power to succeed against them.\r\n", ch );
      return;
    }

  argument = one_argument(argument, arg);

  if ( !*arg )
    {
      send_to_char( "For how long do you wish to delay them?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "none" ) )
    {
      send_to_char( "All character delay removed.\r\n", ch );
      victim->wait = 0;
      return;
    }

  delay = atoi( arg );
  
  if ( delay < 1 )
    {
      send_to_char( "Pointless. Try a positive number.\r\n", ch );
      return;
    }

  if ( delay > 999 )
    {
      send_to_char( "You cruel bastard. Just kill them.\r\n", ch );
      return;
    }

  WAIT_STATE( victim, delay * PULSE_VIOLENCE );
  ch_printf( ch, "You've delayed %s for %d rounds.\r\n", victim->name, delay );
}
