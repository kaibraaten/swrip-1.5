#include "mud.h"

/* lets the mobile transfer people.  the all argument transfers
   everyone in the current room to the specified location */

void do_mptransfer( CHAR_DATA *ch, char *argument )
{
  char             arg1[ MAX_INPUT_LENGTH ];
  char             arg2[ MAX_INPUT_LENGTH ];
  char buf[MAX_STRING_LENGTH];
  ROOM_INDEX_DATA *location;
  CHAR_DATA       *victim;
  CHAR_DATA       *nextinroom;

  if ( IS_AFFECTED( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      progbug( "Mptransfer - Bad syntax", ch );
      return;
    }

  /* Put in the variable nextinroom to make this work right. -Narn */
  if ( !str_cmp( arg1, "all" ) )
    {
      for ( victim = ch->in_room->first_person; victim; victim = nextinroom )
        {
          nextinroom = victim->next_in_room;
          if ( victim != ch
               &&   !NOT_AUTHED(victim)
               &&   can_see( ch, victim ) )
            {
              sprintf( buf, "%s %s", victim->name, arg2 );
              do_mptransfer( ch, buf );
            }
        }
      return;
    }

  /*
   * Thanks to Grodyn for the optional location parameter.
   */
  if ( arg2[0] == '\0' )
    {
      location = ch->in_room;
    }
  else
    {
      if ( ( location = find_location( ch, arg2 ) ) == NULL )
        {
          progbug( "Mptransfer - No such location", ch );
          return;
        }

      if ( room_is_private( ch, location ) )
        {
          progbug( "Mptransfer - Private room", ch );
          return;
        }
    }

  if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
    {
      progbug( "Mptransfer - No such person", ch );
      return;
    }

  if ( !victim->in_room )
    {
      progbug( "Mptransfer - Victim in Limbo", ch );
      return;
    }

  if (NOT_AUTHED(victim) && location->area != victim->in_room->area)
    {
      progbug( "Mptransfer - transferring unauthorized player", ch);
      return;
    }


  /* If victim not in area's level range, do not transfer */
  if ( !in_hard_range( victim, location->area )
       &&   !IS_SET( location->room_flags, ROOM_PROTOTYPE ) )
    return;

  if ( victim->fighting )
    stop_fighting( victim, TRUE );

  char_from_room( victim );
  char_to_room( victim, location );
}
