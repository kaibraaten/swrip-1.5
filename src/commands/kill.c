#include "mud.h"
#include "character.h"

void do_kill( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Kill whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( !IS_NPC(victim) )
    {
      send_to_char( "You must MURDER a player.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "You hit yourself.  Ouch!\r\n", ch );
      multi_hit( ch, ch, TYPE_UNDEFINED );
      return;
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( is_affected_by(ch, AFF_CHARM) && ch->master == victim )
    {
      act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You do the best you can!\r\n", ch );
      return;
    }

  if ( victim->vip_flags != 0 && !IS_SET( victim->act, ACT_DROID )  )
    ch->alignment -= 10;

  WAIT_STATE( ch, 1 * PULSE_VIOLENCE );
  multi_hit( ch, victim, TYPE_UNDEFINED );
}
