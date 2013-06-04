#include "character.h"
#include "mud.h"

/*
 * Simple function to let any imm make any player instantly sober.
 * Saw no need for level restrictions on this.
 * Written by Narn, Apr/96
 */
void do_sober( Character *ch, char *argument )
{
  Character *victim;
  char arg1 [MAX_INPUT_LENGTH];

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( is_npc( victim ) )
    {
      send_to_char( "Not on mobs.\r\n", ch );
      return;
    }

  if ( victim->pcdata )
    victim->pcdata->condition[COND_DRUNK] = 0;

  send_to_char( "Ok.\r\n", ch );
  send_to_char( "You feel sober again.\r\n", victim );
}
