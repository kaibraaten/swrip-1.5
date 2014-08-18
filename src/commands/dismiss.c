#include "character.h"
#include "mud.h"

void do_dismiss( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

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

  if ( IsAffectedBy( victim, AFF_CHARM )
       && IsNpc( victim )
       && victim->master == ch )
    {
      StopFollowing( victim );
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
