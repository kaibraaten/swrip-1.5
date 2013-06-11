#include "character.h"
#include "mud.h"

void do_litterbug( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Set litterbug flag on whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustedLevel( victim ) >= GetTrustedLevel( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_LITTERBUG) )
    {
      REMOVE_BIT(victim->act, PLR_LITTERBUG);
      send_to_char( "You can drop items again.\r\n", victim );
      send_to_char( "LITTERBUG removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_LITTERBUG);
      send_to_char( "You a strange force prevents you from dropping any more items!\r\n", victim );
      send_to_char( "LITTERBUG set.\r\n", ch );
    }
}
