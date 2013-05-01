#include "mud.h"

void do_follow( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Follow whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master )
    {
      act( AT_PLAIN, "But you'd rather follow $N!", ch, NULL, ch->master, TO_CHAR );
      return;
    }

  if ( victim == ch )
    {
      if ( !ch->master )
        {
          send_to_char( "You already follow yourself.\r\n", ch );
          return;
        }
      stop_follower( ch );
      return;
    }

  if ( circle_follow( ch, victim ) )
    {
      send_to_char( "Following in loops is not allowed... sorry.\r\n", ch );
      return;
    }

  if ( ch->master )
    stop_follower( ch );

  add_follower( ch, victim );
}
