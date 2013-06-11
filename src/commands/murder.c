#include "character.h"
#include "mud.h"

void do_murder( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  char  logbuf[MAX_STRING_LENGTH];

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Murder whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( is_affected_by(ch, AFF_CHARM) )
    {
      if ( ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You do the best you can!\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) && IS_SET( ch->act, PLR_NICE ) )
    {
      send_to_char( "You feel too nice to do that!\r\n", ch );
      return;
    }

  if ( !IS_SET( victim->act, ACT_DROID )  )
    ch->alignment -= 10;

  set_wait_state( ch, 1 * PULSE_VIOLENCE );
  multi_hit( ch, victim, TYPE_UNDEFINED );
}
