#include "mud.h"

void do_dismiss( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim = NULL;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Dismiss whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_AFFECTED( victim, AFF_CHARM )
       && IS_NPC( victim )
       && victim->master == ch )
    {
      stop_follower( victim );
      stop_hating( victim );
      stop_hunting( victim );
      stop_fearing( victim );
      act( AT_ACTION, "$n dismisses $N.", ch, NULL, victim, TO_NOTVICT );
      act( AT_ACTION, "You dismiss $N.", ch, NULL, victim, TO_CHAR );
    }
  else
    {
      send_to_char( "You cannot dismiss them.\r\n", ch );
    }
}
