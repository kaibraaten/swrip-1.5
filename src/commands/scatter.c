#include "character.h"
#include "mud.h"

void do_scatter( Character *ch, char *argument )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *pRoomIndex;

  set_char_color( AT_IMMORT, ch );
  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Scatter whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "It's called teleport. Try it.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) && get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You haven't the power to succeed against them.\r\n", ch );
      return;
    }

  for ( ; ; )
    {
      pRoomIndex = get_room_index( number_range( 0, 32767 ) );

      if ( pRoomIndex
	   && !IS_SET(pRoomIndex->room_flags, ROOM_PRIVATE)
	   && !IS_SET(pRoomIndex->room_flags, ROOM_SOLITARY)
	   && !IS_SET(pRoomIndex->room_flags, ROOM_PROTOTYPE)
	   && !IS_SET(pRoomIndex->room_flags, ROOM_SPACECRAFT) )
	{
	  break;
	}
    }



  if ( victim->fighting )
    stop_fighting( victim, TRUE );

  act( AT_MAGIC, "With the sweep of an arm, $n flings $N to the winds.",
       ch, NULL, victim, TO_NOTVICT );
  act( AT_MAGIC, "With the sweep of an arm, $n flings you to the astral winds.", ch, NULL, victim, TO_VICT );
  act( AT_MAGIC, "With the sweep of an arm, you fling $N to the astral winds.",
       ch, NULL, victim, TO_CHAR );
  char_from_room( victim );
  char_to_room( victim, pRoomIndex );
  victim->position = POS_RESTING;
  act( AT_MAGIC, "$n staggers forth from a sudden gust of wind, and collapses.", victim, NULL, NULL, TO_ROOM );
  do_look( victim, "auto" );
}
