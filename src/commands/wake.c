#include "mud.h"

void do_wake( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim = NULL;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      do_stand( ch, argument );
      return;
    }

  if ( !IS_AWAKE(ch) )
    {
      send_to_char( "You are asleep yourself!\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_AWAKE(victim) )
    {
      act( AT_PLAIN, "$N is already awake.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IS_AFFECTED(victim, AFF_SLEEP) || victim->position < POS_SLEEPING )
    {
      act( AT_PLAIN, "You can't seem to wake $M!",
	   ch, NULL, victim, TO_CHAR );
      return;
    }

  act( AT_ACTION, "You wake $M.", ch, NULL, victim, TO_CHAR );
  victim->position = POS_STANDING;
  act( AT_ACTION, "$n wakes you.", ch, NULL, victim, TO_VICT );
}