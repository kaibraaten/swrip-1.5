#include "character.h"
#include "mud.h"

void do_deny( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Deny whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  SET_BIT(victim->act, PLR_DENY);
  send_to_char( "You are denied access!\r\n", victim );
  send_to_char( "OK.\r\n", ch );
  do_quit( victim, "" );
}
