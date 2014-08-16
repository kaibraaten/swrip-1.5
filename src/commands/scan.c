#include "character.h"
#include "mud.h"

void show_char_to_char( Character *list, Character *ch );

void do_scan( Character *ch, char *argument )
{
  ROOM_INDEX_DATA *was_in_room;
  ROOM_INDEX_DATA *to_room;
  Exit *pexit;
  short dir = -1;
  short dist;
  short max_dist = 5;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Scan in a direction...\r\n", ch );
      return;
    }

  if ( ( dir = get_dir( argument ) ) == -1 )
    {
      ch_printf( ch, "Scan in WHAT direction?\r\n" );
      return;
    }

  was_in_room = ch->in_room;
  act( AT_GREY, "Scanning $t...", ch, get_dir_name(dir), NULL, TO_CHAR );
  act( AT_GREY, "$n scans $t.", ch, get_dir_name(dir), NULL, TO_ROOM );

  if ( IsNpc( ch )
       || ( number_percent() > ch->pcdata->learned[gsn_scan] ) )
    {
      act( AT_GREY, "You stop scanning $t as your vision blurs.", ch,
           get_dir_name(dir), NULL, TO_CHAR );
      learn_from_failure( ch, gsn_scan );
      return;
    }


  if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
    {
      act( AT_GREY, "You can't see $t.", ch, get_dir_name(dir), NULL, TO_CHAR );
      return;
    }

  if ( ch->top_level < 50 ) max_dist--;
  if ( ch->top_level < 20 ) max_dist--;

  for ( dist = 1; dist <= max_dist; )
    {
      if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
        {
          if ( IS_SET( pexit->exit_info, EX_SECRET ) )
            act( AT_GREY, "Your view $t is blocked by a wall.", ch,
                 get_dir_name(dir), NULL, TO_CHAR );
          else
            act( AT_GREY, "Your view $t is blocked by a door.", ch,
                 get_dir_name(dir), NULL, TO_CHAR );
          break;
        }

      to_room = NULL;
      if ( pexit->distance > 1 )
        to_room = generate_exit( ch->in_room , &pexit );

      if ( to_room == NULL )
        to_room = pexit->to_room;

      if ( room_is_private( ch, to_room )
           && GetTrustLevel(ch) < LEVEL_GREATER )
        {
          act( AT_GREY, "Your view $t is blocked by a private room.", ch,
               get_dir_name(dir), NULL, TO_CHAR );
	  break;
        }
      char_from_room( ch );
      char_to_room( ch, to_room );
      set_char_color( AT_RMNAME, ch );
      send_to_char( ch->in_room->name, ch );
      send_to_char( "\r\n", ch );
      show_list_to_char( ch->in_room->first_content, ch, false, false );
      show_char_to_char( ch->in_room->first_person, ch );

      switch( ch->in_room->sector_type )
        {
        default: dist++; break;
        case SECT_AIR:
          if ( number_percent() < 80 ) dist++; break;
        case SECT_INSIDE:
        case SECT_FIELD:
        case SECT_UNDERGROUND:
          dist++; break;
        case SECT_FOREST:
        case SECT_CITY:
        case SECT_DESERT:
        case SECT_HILLS:
          dist += 2; break;
        case SECT_WATER_SWIM:
        case SECT_WATER_NOSWIM:
          dist += 3; break;
        case SECT_MOUNTAIN:
        case SECT_UNDERWATER:
        case SECT_OCEANFLOOR:
          dist += 4; break;
        }

      if ( dist >= max_dist )
        {
          act( AT_GREY, "Your vision blurs with distance and you see no "
               "farther $t.", ch, get_dir_name(dir), NULL, TO_CHAR );
          break;
        }
      if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
        {
          act( AT_GREY, "Your view $t is blocked by a wall.", ch,
               get_dir_name(dir), NULL, TO_CHAR );
          break;
        }
    }

  char_from_room( ch );
  char_to_room( ch, was_in_room );
  learn_from_success( ch, gsn_scan );
}
