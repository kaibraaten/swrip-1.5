#include "character.h"
#include "mud.h"

void show_char_to_char( Character *list, Character *ch );

void do_scan( Character *ch, char *argument )
{
  Room *was_in_room;
  Room *to_room;
  Exit *pexit;
  short dir = -1;
  short dist;
  short max_dist = 5;

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Scan in a direction...\r\n", ch );
      return;
    }

  if ( ( dir = GetDirection( argument ) ) == -1 )
    {
      ChPrintf( ch, "Scan in WHAT direction?\r\n" );
      return;
    }

  was_in_room = ch->in_room;
  act( AT_GREY, "Scanning $t...", ch, GetDirectionName(dir), NULL, TO_CHAR );
  act( AT_GREY, "$n scans $t.", ch, GetDirectionName(dir), NULL, TO_ROOM );

  if ( IsNpc( ch )
       || ( GetRandomPercent() > ch->pcdata->learned[gsn_scan] ) )
    {
      act( AT_GREY, "You stop scanning $t as your vision blurs.", ch,
           GetDirectionName(dir), NULL, TO_CHAR );
      learn_from_failure( ch, gsn_scan );
      return;
    }


  if ( ( pexit = GetExit( ch->in_room, dir ) ) == NULL )
    {
      act( AT_GREY, "You can't see $t.", ch, GetDirectionName(dir), NULL, TO_CHAR );
      return;
    }

  if ( ch->top_level < 50 ) max_dist--;
  if ( ch->top_level < 20 ) max_dist--;

  for ( dist = 1; dist <= max_dist; )
    {
      if ( IsBitSet( pexit->exit_info, EX_CLOSED ) )
        {
          if ( IsBitSet( pexit->exit_info, EX_SECRET ) )
            act( AT_GREY, "Your view $t is blocked by a wall.", ch,
                 GetDirectionName(dir), NULL, TO_CHAR );
          else
            act( AT_GREY, "Your view $t is blocked by a door.", ch,
                 GetDirectionName(dir), NULL, TO_CHAR );
          break;
        }

      to_room = NULL;
      if ( pexit->distance > 1 )
        to_room = GenerateExit( ch->in_room , &pexit );

      if ( to_room == NULL )
        to_room = pexit->to_room;

      if ( room_is_private( ch, to_room )
           && GetTrustLevel(ch) < LEVEL_GREATER )
        {
          act( AT_GREY, "Your view $t is blocked by a private room.", ch,
               GetDirectionName(dir), NULL, TO_CHAR );
	  break;
        }
      char_from_room( ch );
      char_to_room( ch, to_room );
      SetCharacterColor( AT_RMNAME, ch );
      SendToCharacter( ch->in_room->name, ch );
      SendToCharacter( "\r\n", ch );
      ShowObjectListToCharacter( ch->in_room->first_content, ch, false, false );
      show_char_to_char( ch->in_room->first_person, ch );

      switch( ch->in_room->sector_type )
        {
        default: dist++; break;
        case SECT_AIR:
          if ( GetRandomPercent() < 80 ) dist++; break;
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
               "farther $t.", ch, GetDirectionName(dir), NULL, TO_CHAR );
          break;
        }
      if ( ( pexit = GetExit( ch->in_room, dir ) ) == NULL )
        {
          act( AT_GREY, "Your view $t is blocked by a wall.", ch,
               GetDirectionName(dir), NULL, TO_CHAR );
          break;
        }
    }

  char_from_room( ch );
  char_to_room( ch, was_in_room );
  learn_from_success( ch, gsn_scan );
}
