#include <string.h>
#include "mud.h"
#include "character.h"

void do_order( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argbuf[MAX_INPUT_LENGTH];
  CHAR_DATA *victim = NULL;
  CHAR_DATA *och = NULL;
  CHAR_DATA *och_next = NULL;
  bool found = FALSE;
  bool fAll = FALSE;

  strcpy( argbuf, argument );
  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Order whom to do what?\r\n", ch );
      return;
    }

  if ( is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You feel like taking, not giving, orders.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      fAll = TRUE;
    }
  else
    {
      if ( ( victim = get_char_room( ch, arg ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          send_to_char( "Aye aye, right away!\r\n", ch );
          return;
        }

      if ( !is_affected_by(victim, AFF_CHARM) || victim->master != ch )
        {
          send_to_char( "Do it yourself!\r\n", ch );
          return;
        }
    }

  if ( !str_prefix("mp",argument) )
    {
      send_to_char( "But that's cheating!\r\n", ch );
      return;
    }

  for ( och = ch->in_room->first_person; och; och = och_next )
    {
      och_next = och->next_in_room;

      if ( is_affected_by(och, AFF_CHARM)
           && och->master == ch
           && ( fAll || och == victim ) )
        {
          found = TRUE;
          act( AT_ACTION, "$n orders you to '$t'.",
	       ch, argument, och, TO_VICT );
	  interpret( och, argument );
        }
    }

  if ( found )
    {
      sprintf( log_buf, "%s: order %s.", ch->name, argbuf );
      log_string_plus( log_buf, LOG_NORMAL, ch->top_level );
      send_to_char( "Ok.\r\n", ch );
      WAIT_STATE( ch, 12 );
    }
  else
    {
      send_to_char( "You have no followers here.\r\n", ch );
    }
}
