#include "character.h"
#include "mud.h"

void do_recall( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *location;
  CHAR_DATA *opponent;

  location = NULL;

  location = get_room_index( wherehome(ch) );

  if ( get_trust( ch ) < LEVEL_IMMORTAL )
    {
      AREA_DATA * pArea;

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "Only builders can recall.\r\n", ch );
          return;
        }

      if  ( ch->in_room->vnum < pArea->low_r_vnum
            || ch->in_room->vnum > pArea->hi_r_vnum )
        {
          send_to_char( "You can only recall from your assigned area.\r\n", ch );
          return;
	}
    }

  if ( !location )
    {
      send_to_char( "You are completely lost.\r\n", ch );
      return;
    }

  if ( ch->in_room == location )
    return;

  /*    if ( IS_SET(ch->in_room->room_flags, ROOM_NO_RECALL) )
        {
        send_to_char( "For some strange reason... nothing happens.\r\n", ch );
        return;
        }*/

  if ( IS_SET(ch->affected_by, AFF_CURSE) )
    {
      send_to_char("You are cursed and cannot recall!\r\n", ch );
      return;
    }

  if ( ( opponent = who_fighting( ch ) ) != NULL )
    {

      if ( number_bits( 1 ) == 0 || ( !is_npc( opponent ) && number_bits( 3 ) > 1 ) )
        {
          set_wait_state( ch, 4 );
          ch_printf( ch, "You failed!\r\n" );
          return;
        }

      ch_printf( ch, "You recall from combat!\r\n" );
      stop_fighting( ch, TRUE );
    }

  act( AT_ACTION, "$n disappears in a swirl of the Force.", ch, NULL, NULL, TO_ROOM );
  char_from_room( ch );
  char_to_room( ch, location );
  if ( ch->mount )
    {
      char_from_room( ch->mount );
      char_to_room( ch->mount, location );
    }
  act( AT_ACTION, "$n appears in a swirl of the Force.", ch, NULL, NULL, TO_ROOM );
  do_look( ch, "auto" );
}
