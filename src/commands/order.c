#include <string.h>
#include "mud.h"
#include "character.h"

static bool IsUnderlingOf( void *element, void *userData );

void do_order( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argbuf[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  bool found = FALSE;
  bool fAll = FALSE;
  CerisList *underlings = NULL;
  CerisListIterator *underlingIterator = NULL;

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

  underlings = List_CopyIf( ch->in_room->People, IsUnderlingOf, ch );
  underlingIterator = CreateListIterator( underlings, ForwardsIterator );

  for( ; !ListIterator_IsDone( underlingIterator ); ListIterator_Next( underlingIterator ) )
    {
      Character *och = (Character*) ListIterator_GetData( underlingIterator );

      if ( fAll || och == victim )
        {
          found = TRUE;
          act( AT_ACTION, "$n orders you to '$t'.",
	       ch, argument, och, TO_VICT );
	  interpret( och, argument );
        }
    }

  DestroyListIterator( underlingIterator );
  DestroyList( underlings );

  if ( found )
    {
      sprintf( log_buf, "%s: order %s.", ch->name, argbuf );
      log_string_plus( log_buf, LOG_NORMAL, ch->top_level );
      send_to_char( "Ok.\r\n", ch );
      set_wait_state( ch, 12 );
    }
  else
    {
      send_to_char( "You have no followers here.\r\n", ch );
    }
}

static bool IsUnderlingOf( void *element, void *userData )
{
  const Character *underling = (Character*) element;
  const Character *master = (Character*) userData;

  return is_affected_by( underling, AFF_CHARM ) && underling->master == master;
}
