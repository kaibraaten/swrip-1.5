#include "mud.h"
#include "character.h"

void do_notitle( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Notitle whom?\r\n", ch );
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

  if ( IS_SET(victim->pcdata->flags, PCFLAG_NOTITLE) )
    {
      REMOVE_BIT(victim->pcdata->flags, PCFLAG_NOTITLE);
      send_to_char( "You can set your own title again.\r\n", victim );
      send_to_char( "NOTITLE removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->pcdata->flags, PCFLAG_NOTITLE);
      sprintf( buf, "%s", victim->name );
      set_title( victim, buf );
      send_to_char( "You can't set your own title!\r\n", victim );
      send_to_char( "NOTITLE set.\r\n", ch );
    }
}
