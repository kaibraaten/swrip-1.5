#include "mud.h"
#include "character.h"

void do_noemote( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Noemote whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_NO_EMOTE) )
    {
      REMOVE_BIT(victim->act, PLR_NO_EMOTE);
      send_to_char( "You can emote again.\r\n", victim );
      send_to_char( "NO_EMOTE removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_NO_EMOTE);
      send_to_char( "You can't emote!\r\n", victim );
      send_to_char( "NO_EMOTE set.\r\n", ch );
    }
}
