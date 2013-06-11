#include "mud.h"
#include "character.h"

void do_notell( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Notell whom?", ch );
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

  if ( IS_SET(victim->act, PLR_NO_TELL) )
    {
      REMOVE_BIT(victim->act, PLR_NO_TELL);
      send_to_char( "You can tell again.\r\n", victim );
      send_to_char( "NO_TELL removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_NO_TELL);
      send_to_char( "You can't tell!\r\n", victim );
      send_to_char( "NO_TELL set.\r\n", ch );
    }
}
