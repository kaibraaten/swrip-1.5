#include "character.h"
#include "mud.h"

void do_goto( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  CHAR_DATA *fch;
  CHAR_DATA *fch_next;
  ROOM_INDEX_DATA *in_room;
  AREA_DATA *pArea;
  short vnum;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Goto where?\r\n", ch );
      return;
    }

  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      vnum = atoi( arg );
      if ( vnum < 0 || get_room_index( vnum ) )
        {
          send_to_char( "You cannot find that...\r\n", ch );
          return;
	}

      if ( vnum < 1 || is_npc(ch) || !ch->pcdata->area )
        {
          send_to_char( "No such location.\r\n", ch );
          return;
        }
      if ( get_trust( ch ) < sysdata.level_modify_proto &&
           !( ch->pcdata->bestowments && is_name( "intergoto", ch->pcdata->bestowments) ))

        {
          if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
            {
              send_to_char( "You must have an assigned area to create rooms.\r\n", ch );
              return;
            }
          if ( vnum < pArea->low_r_vnum
               ||   vnum > pArea->hi_r_vnum  )
            {
              send_to_char( "That room is not within your assigned range.\r\n", ch );
              return;
            }
        }
      location = make_room( vnum );
      if ( !location )
        {
          bug( "Goto: make_room failed", 0 );
          return;
        }
      location->area = ch->pcdata->area;
      set_char_color( AT_WHITE, ch );
      send_to_char( "Waving your hand, you form order from swirling chaos,\r\nand step into a new reality...\r\n", ch );
    }

  if ( room_is_private(ch, location ) )
    {
      if ( get_trust( ch ) < sysdata.level_override_private
	   || ( ch->top_level == 105 ? 0 : ( location->vnum == IMP_ROOM1 ? 1 : ( location->vnum == IMP_ROOM2 ? 1 : 0 ) ) ) )
        {
          send_to_char( "That room is private right now.\r\n", ch );
          return;
        }
      else
	send_to_char( "Overriding private flag!\r\n", ch );
    }

  if ( get_trust( ch ) < LEVEL_GOD &&
       !( ch->pcdata->bestowments && is_name( "intergoto", ch->pcdata->bestowments) ))
    {
      vnum = atoi( arg );

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( vnum < pArea->low_r_vnum
           ||  vnum > pArea->hi_r_vnum )
        {
          send_to_char( "That room is not within your assigned range.\r\n", ch );
          return;
        }

      if ( ( ch->in_room->vnum < pArea->low_r_vnum || ch->in_room->vnum > pArea->hi_r_vnum )
	   && !IS_SET(ch->in_room->room_flags , ROOM_HOTEL) )
        {
          send_to_char( "Builders can only use goto from a hotel or in their zone.\r\n", ch );
          return;
        }

    }

  in_room = ch->in_room;

  if ( ch->fighting )
    stop_fighting( ch, TRUE );

  if ( !IS_SET(ch->act, PLR_WIZINVIS) )
    {
      if (ch->pcdata && ch->pcdata->bamfout[0] != '\0')
        act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfout ,  TO_ROOM );
      else
        act( AT_IMMORT, "$n $T", ch, NULL, "leaves in a swirl of the force.",  TO_ROOM );
    }

  ch->regoto = ch->in_room->vnum;
  char_from_room( ch );

  if ( ch->mount )
    {
      char_from_room( ch->mount );
      char_to_room( ch->mount, location );
    }

  char_to_room( ch, location );

  if ( !IS_SET(ch->act, PLR_WIZINVIS) )
    {
      if (ch->pcdata && ch->pcdata->bamfin[0] != '\0')
        act( AT_IMMORT, "$T", ch, NULL, ch->pcdata->bamfin ,  TO_ROOM );
      else
        act( AT_IMMORT, "$n $T", ch, NULL, "enters in a swirl of the Force.",  TO_ROOM );
    }



  do_look( ch, "auto" );

  if ( ch->in_room == in_room )
    return;

  for ( fch = in_room->first_person; fch; fch = fch_next )
    {
      fch_next = fch->next_in_room;
      if ( fch->master == ch && IS_IMMORTAL(fch) )
        {
          act( AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR );
          do_goto( fch, argument );
        }
    }
}
